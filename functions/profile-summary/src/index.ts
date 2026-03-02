import axios from 'axios';
import 'dotenv/config';

const GRAPHQL_URL = process.env.GRAPHQL_URL!;

function calculateAge(birthDate: string): number {
  const birth = new Date(birthDate);
  const today = new Date();

  let age = today.getFullYear() - birth.getFullYear();
  const monthDiff = today.getMonth() - birth.getMonth();

  if (
    monthDiff < 0 ||
    (monthDiff === 0 && today.getDate() < birth.getDate())
  ) {
    age--;
  }

  return age;
}

function formatDate(date: string): string {
  return new Date(date).toLocaleDateString('pt-BR');
}

export const profileSummary = async (req: any, res: any) => {
  try {
    const response = await axios.post(GRAPHQL_URL, {
      query: `
        query {
          profile {
            name
            birthDate
            jobTitle
            city
            email
          }
          hobbies {
            name
          }
        }
      `
    });

    const profile = response.data.data.profile;
    const hobbies = response.data.data.hobbies;
    const hobbyNames = hobbies.map((hobby: any) => hobby.name);

    const age = calculateAge(profile.birthDate);

    res.status(200).json({
      name: profile.name,
      jobTitle: profile.jobTitle,
      city: profile.city,
      email: profile.email,
      birthDate: formatDate(profile.birthDate),
      age,
      hobbies: hobbyNames
    });
  } catch (error: any) {
    res.status(500).json({ error: 'Failed to fetch profile' });
  }
};
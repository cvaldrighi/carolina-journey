import axios from 'axios';
import 'dotenv/config';

const GRAPHQL_URL = process.env.GRAPHQL_URL!;

export const careerSummary = async (req: any, res: any) => {
  try {
    const response = await axios.post(GRAPHQL_URL, {
      query: `
        query {
          experiences {
            company
            jobTitle
            startDate
            endDate
            skills { name }
            highlights { description }
          }
        }
      `
    });

    const experiences = response.data.data.experiences;

    const sortedExperiences = [...experiences].sort((a: any, b: any) => {
      return new Date(b.startDate).getTime() - new Date(a.startDate).getTime();
    });

    const formattedExperiences = sortedExperiences.map((exp: any) => {
      const startYear = new Date(exp.startDate).getFullYear();
      const endYear = exp.endDate
        ? new Date(exp.endDate).getFullYear()
        : 'Atualmente';

      return {
        company: exp.company,
        role: exp.jobTitle,
        period: `${startYear} - ${endYear}`,
        skills: exp.skills.map((s: any) => s.name),
        highlights: exp.highlights.map(
          (h: any) => h.description.replace(/\r\n/g, ' ')
                                   .replace(/\s+/g, ' ')
                                   .trim()
        )
      };
    });

    res.status(200).json({
      totalExperiences: formattedExperiences.length,
      experiences: formattedExperiences
    });

  } catch (error: any) {
    console.error(error.response?.data || error);
    res.status(500).json({
      error: error.response?.data || 'Failed to fetch career data'
    });
  }
};

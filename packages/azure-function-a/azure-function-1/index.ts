import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { addTwoNumbers } from 'common'

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');
    const firstNumber = (req.query.firstNumber || (req.body && req.body.firstNumber));
    const secondNumber = (req.query.secondNumber || (req.body && req.body.secondNumber));
    const responseMessage = addTwoNumbers(firstNumber, secondNumber)
    context.res = {
        // status: 200, /* Defaults to 200 */
        body: responseMessage
    };

};

export default httpTrigger;
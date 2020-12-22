import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class AboutUsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 10 , top: 10 ,right: 10 ),
        child: SingleChildScrollView (
          child: Column(
            children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "Shall",
                        style: TextStyle(color: ksecondaryColor),
                      ),
                      TextSpan(
                        text: "all",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox (height: 20,),
              Text (
                'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'kjsdfkj gaskgfk gsdkfk gskdagfkls akdg fk sgakf gksg djkf gasgdfkj gjksdgfkjsadfg g'
                    'dkslhf sdgfjs dfg dskjkfgds fadkfkasgfkjgsdkfg kjsgfgdsjfgjgf ds'
                    'dkslhf sdgfjs dfg dskjkfgds fadkfkasgfkjgsdkfg kjsgfgdsjfgjgf ds'
                    'dkslhf sdgfjs dfg dskjkfgds fadkfkasgfkjgsdkfg kjsgfgdsjfgjgf ds'
                    'dkslhf sdgfjs dfg dskjkfgds fadkfkasgfkjgsdkfg kjsgfgdsjfgjgf ds'
                    'dkslhf sdgfjs dfg dskjkfgds fadkfkasgfkjgsdkfg kjsgfgdsjfgjgf ds'
                    'dkslhf sdgfjs dfg dskjkfgds fadkfkasgfkjgsdkfg kjsgfgdsjfgjgf ds'
                    'dkslhf sdgfjs dfg dskjkfgds fadkfkasgfkjgsdkfg kjsgfgdsjfgjgf ds',
                maxLines: 200,
                style: TextStyle (
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

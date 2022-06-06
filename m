Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D566853DF7B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jun 2022 03:46:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ny1ox-0007n3-Ol; Mon, 06 Jun 2022 01:46:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <career@aaj.jo>) id 1ny1ow-0007mw-Af
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jun 2022 01:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:Message-ID:
 To:From:Date:Subject:Sender:Reply-To:Cc:MIME-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1kIVQnEq3tUiqgkWgXApXJNbhTwb8/YXSv5lz9+pXho=; b=DdQwlNLDEJ5nkmhaTNYp9DXa6N
 D4bOAisP9bTFDD0GaEWGmXuKbgmep1Af4bGuyZY2saFPCTI02thJsdNcdzcd8wW5Hj+H7HOTynFZI
 UtzpCZUzx/2wqWrbJ66zaR+FwMXonot+9VPxWqmt2Qgx03f+Z/qYoQDU+R71A7DKH6gM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:Message-ID:To:From:Date:Subject:
 Sender:Reply-To:Cc:MIME-Version:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1kIVQnEq3tUiqgkWgXApXJNbhTwb8/YXSv5lz9+pXho=; b=I
 +QYLTX4X67YqZOURNG5guhIcxXgTtN2ZGPjON5NgnkUYTlz3K0J/w6jqfrK/qZ0dQsPwauKutTkud
 ALHqRfUwJ6Mo2/3p5Ka4T/4xQoMTsOL55oFgNXjlIapxqfi7LQvGmz3WKI9pM8pYbNzxRZvL60VsR
 4kPF+kXMCtd1yrbo=;
Received: from mx2out5.tmdhosting.com ([96.127.138.118])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ny1ov-006Z6m-OI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jun 2022 01:46:18 +0000
Received: from win08.tmd.cloud ([207.246.94.224] helo=GUEST.home)
 by mx2.tmdhosting.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <career@aaj.jo>) id 1ny1Sh-0006sO-4i
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 20:23:21 -0500
Received: from [127.0.0.1] ([177.130.171.168]) by home with
 MailEnable ESMTPSA (version=TLS1 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA);
 Mon, 6 Jun 2022 01:23:17 +0000
Date: Mon, 6 Jun 2022 03:23:18 +0200
From: career@aaj.jo
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <5342963865.9986545918@aaj.jo>
X-Mailgun-Tag: [mailing_type=qxu][sender=ox-xmlback][hhid=41213144]
X-Originating-IP: 207.246.94.224
X-SpamExperts-Domain: smtp-out.win08.tmd.cloud
X-SpamExperts-Username: 207.246.94.224
Authentication-Results: tmdhosting.com; auth=pass
 smtp.auth=207.246.94.224@smtp-out.win08.tmd.cloud
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.78)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+2UhXb9FnxIwgZyWgLgxoDPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5yK/KhRMxX0aT131Jm2Fh0CszYZUxeoE762aCR2BMWArhij
 RIGonHehU4ttI9uxvUKCSzNIuWQJrNBB673AmlSDcvB8uallhxsJtmdxw53jncyF1edjsnoh92FV
 V/dq/cempcAwp8bpABR9GpA5j74SivDtb8u21gIDZCxCQllwwY+LQDa8vBw0SPEaOIISt34TMsTg
 TRkweE800fXt+7og0KYo6kU9Sfqt8wNBfhef/N8cjIN3reG9z0FKKQ5m2Qooa20mCX0fi2bWQ7rT
 SQDxs5srTnb+Mu57A5wjlqYzGz24rQe9+/XtclLOTVMRq9W72rVlokj9CcZZe4NWxmYt/drCsCnO
 nsANN2q4EksvqgUvossjam0/HVDFzCeLVAjI+ht+2XwDC3Hj+WjRz7duP3b6Xvyk68MEHpzIanIQ
 sE1jxABFCjAdqb0oBEIWGuehP7r/qeCcLfNPkwm2lNnsvr3LBR8rUYXJ4jh62pfHaKqsknzQ1WVE
 SSlbgJ6e928BIkUL/j1Y48GvmeURQjjEnjMI8Y9RCSLaut0QC+MQrmfiQrMfScrussttAUc8XwJZ
 11qnY4wbF7KCDvUZIVFDfj8M4GsHK0/D3oIdUI6fcJRL0i6mhXmJtukpoDVKHf0lC1QqG5wZG0oX
 2QUKBbmIiwQzKw+6v3CaIMG6s7LqJA8YLAp9plc/GdYJ8EvNBboQZr17DOotrcXcb8uI4xqPpX7w
 4srUW008mRT/iiVWJWLua3RJ0N4pwp1zcex/7jgpeek/moZhIptYgRclsq4VJ5evPWCjhqsXUbga
 wYOdazcKVNeVJ9BXyu9+ceCqThSX2yfz7w+pE3EJCpxbPklZFjOk+oYG9HSSzX8ii5KOS7N7qYLA
 tCcaTgmnmyZDzqOhzttXT6cT4TBXzjfG6WzXmQV5l3l7LwSdTkQ7lhOUJ7Gxkpi8Jh6krBlxCujh
 yW/2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@mx1.tmdhosting.com
X-Spam-Score: 3.5 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I got terrible information just for you. Earlier Managed to
 get admission to your personal systems. After that, I initiated tracking
 your activities. I mounted a Computer virus on the systems in all devices
 which you utilize to get into the Internet. 
 Content analysis details:   (3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 1.0 BITCOIN_SPAM_09        BitCoin spam pattern 09
 0.5 PDS_BTC_ID             FP reduced Bitcoin ID
 1.0 BITCOIN_EXTORT_01      Extortion spam, pay via BitCoin
X-Headers-End: 1ny1ov-006Z6m-OI
Subject: [f2fs-dev] Here is the last warning! Your information has been
 compromised! The entry in system is completed.
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I got  terrible  information  just  for you. 
Earlier  Managed to  get admission to  your personal  systems. 



After that, I  initiated  tracking your  activities. 
I mounted a  Computer  virus on  the systems in all  devices which you utilize  to  get into the  Internet. 



The following software offers  me access  to all of  your gadgets. 
I've downloaded  all of  your info,  pictures, and  searching history  to my  own hosts. 



I just  got connection  to all of  your info,  communication messengers, social  network, contact  information, email  and so  forth. 

My  computer virus  updates signatures  and remains  undetectable to  anti virus  applications. 



Whilst getting  information about  you, I  came across  you're  a good  admirer of  grown-up web  sites and  are watching  intriguing video  clips while  going through a  huge amount  of  fun. 

I was  capable  to record  some of your  filthy scenes  when  you  masturbate  and achieve  orgasmic pleasure. 





If there  are  any doubts,  I can make  a couple  of mouse  clicks and  all clips are going  to be  demonstrated to  everyone you  know. 

Plus  I am  able to  publish all  your letters,  personal photos,  and  your private  information on  the net. I  can destroy  your status  forever. 


I believe  you really do  not want  this to  happen, given  the character  of the  videos you  adore to  watch,  you know  what  I'm  talking about,  it  will be an  absolute disaster  in  your  case. 


Let's  resolve that  by  doing this:  you send  me 1300  DOLLARS (in  bitcoin equivalent  to  the swap rate  at the  time of exchange),  & I  will immediately  remove everything. Then,  we'll  forget about  one  another. 


I also promise  to deactivate  & get  rid of  all trojans  from  your gadgets. 



Remember  that I usually  keep my  own word  of mouth. Here's my  btc address:  bc1qpqum4asxh2rd0twkam3768jgd58v29z6v0gxh7



You got  Two days from  the moment  you view  this particular  e mail. 




If you  don't forward  cash, your  video clip  and all  your data are going to  be published  on the  web for  all people  as  well as  your family members. I  will ruin your  status  permanently. 




Don't  seek me  and don't contact  the  authorities  along  with other  help,  otherwise  your  computer data will  be published. 

I  know  many secrets about who  you are, therefore  in  case  your reputation  is worthy,  bear  in mind  that  I can ruin  it once  and for all.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

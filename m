Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086B1E9447
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 May 2020 00:33:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfA2F-0007FM-Rp; Sat, 30 May 2020 22:32:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deanj00@acceswealthservice.xyz>) id 1jfA2E-0007F4-Tx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 22:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=td/1klW8T5Eyprv/u3iSt1Uq3pUK6RiW9JQei4VLqgo=; b=Vk4l0Eps+gOsv9yJ6bQLzWjUSS
 mSBsKu3zQptwUFKgEmygkDtYX4VUAHCbHZco+/xZo2QED6UvQIbysdT2teRgeI1DvomGCnSCXGpdO
 Su/4zeStNA/aIqtgxiPABJXYtOJ4vqxdUM0MrBZ1Id+7eITkPYx+FHAze+p/EIDE67dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=td/1klW8T5Eyprv/u3iSt1Uq3pUK6RiW9JQei4VLqgo=; b=Q
 SdFvoUuLBvcMQM0rXiA+NTZJp4MKYEjbJwOfw/qZ+FDkwQxXvLdGernrQwesLCSFtX04GzsIkwyIc
 z2xWHMGBc8tlcvJPce17fBHaj0auIBPyI+MTNf+/8Jq+foYhS51IBVp73o9T+wXCEaynn3Y6QZ1ZZ
 oGkVJlhYEq9XnJwk=;
Received: from [46.166.185.243] (helo=host.acceswealthservice.xyz)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jfA2D-001ImX-NL
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 22:32:58 +0000
Received: from acceswealthservice.xyz (2t5j.w.time4vps.cloud [212.24.97.110])
 by host.acceswealthservice.xyz (Postfix) with ESMTPA id 8D8A8F6884
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 May 2020 00:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 host.acceswealthservice.xyz 8D8A8F6884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=acceswealthservice.xyz; s=default; t=1590877784;
 bh=td/1klW8T5Eyprv/u3iSt1Uq3pUK6RiW9JQei4VLqgo=;
 h=Reply-To:From:To:Subject:Date:From;
 b=OetyrdCuKh8H82Z9b2fgIXI+xyKD7A9ByQ28y/0HjEBLPgoy4I4iL3RFMgA0CoI59
 BSkjeAMrBwS3Zq0rupFAhaIfgc9LOIauDRe47AtpCrwL48Alfko4NJ8/4TYpM4BnxL
 yI57gmeZRQjweg0XaMFOjXcrH3OWSAU8CcK09XQk=
DKIM-Filter: OpenDKIM Filter v2.11.0 host.acceswealthservice.xyz 8D8A8F6884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=acceswealthservice.xyz; s=default; t=1590877784;
 bh=td/1klW8T5Eyprv/u3iSt1Uq3pUK6RiW9JQei4VLqgo=;
 h=Reply-To:From:To:Subject:Date:From;
 b=OetyrdCuKh8H82Z9b2fgIXI+xyKD7A9ByQ28y/0HjEBLPgoy4I4iL3RFMgA0CoI59
 BSkjeAMrBwS3Zq0rupFAhaIfgc9LOIauDRe47AtpCrwL48Alfko4NJ8/4TYpM4BnxL
 yI57gmeZRQjweg0XaMFOjXcrH3OWSAU8CcK09XQk=
From: Dean <deanj00@acceswealthservice.xyz>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 31 May 2020 01:29:44 +0300
Message-ID: <20200531012944.28252F8E7CBEF75B@acceswealthservice.xyz>
Mime-Version: 1.0
X-Spam-Score: 4.7 (++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [46.166.185.243 listed in zen.spamhaus.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfA2D-001ImX-NL
Subject: [f2fs-dev] Investment
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
Reply-To: deanj22@accesswealthservices.online
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good evening. I am Dean Johnston, a broker working with Access 
Wealth Services. I am contacting you because one of my high 
profile clients is interested in investing abroad and has asked 
me to look for individuals and companies with interesting 
business ideas and companies that he can invest in. He wants to 
expand his portfolio and has interest in investing a substantial 
amount of asset abroad. I got your contact (along with other 
contacts) through an online business directory and I thought I'd 
contact you to see if you are interested in this opportunity.

Please indicate your interest by replying back to this email. 
Once I get your response, I will give you more details and we can 
plan a strategy that will be beneficial to all parties.

Best regards

D Johnston
Access Wealth Services
+27319400855


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

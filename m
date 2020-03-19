Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFF18AD4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 08:28:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEpb2-0004wp-6V; Thu, 19 Mar 2020 07:28:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <info56@appletoncreative.com>) id 1jEpb0-0004wi-JG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 07:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FWtie/Q5hJ/5u4V2agqx2Y9+mJbT6joJtZJP/PPrJKc=; b=ROQ4pgNNZF4FAclMCjnHU6Loxb
 3qznO8MnuteTV4XvkYJ+cGFqptnitmTMJCsMsEswmtGgd21h07tuYAs8DBAPnKzG6clK64PKriNjz
 MnbBlIKKTWCqAJLW67lZzuBiWY51bEPeTg7/xy3/NlpGocmawtjk8Y6eBrjH9YjwuGfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FWtie/Q5hJ/5u4V2agqx2Y9+mJbT6joJtZJP/PPrJKc=; b=a
 eg6vBo9HLAYTHnCWOKYfuNOnTRWOgcY7ETsMlhzr7GUH8/4eMDGlDv6O7FS2MiHfEmw6fI3xsz37S
 rA4Arc600wgyGvMjh0qJ1ZWaWwtx3FZWtWmQeyuiYjTB2Whjrz16x8qt4SExtK8Fsd2uRLDw83Qsi
 0ckTJiOBxPbQWn+g=;
Received: from [202.89.0.21] (helo=CentOS5.cih.org.hk)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.92.2) id 1jEpay-008aZu-JP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 07:28:02 +0000
Received: (qmail 8305 invoked by uid 89); 19 Mar 2020 04:01:08 -0000
Received: by simscan 1.3.1 ppid: 7003, pid: 8267, t: 3.4620s
 scanners: attach: 1.3.1 clamav: 0.98.4/m:
Received: from unknown (HELO ?202.186.166.133?)
 (choitszping@cih.org.hk@103.231.90.2)
 by server1 with ESMTPA; 19 Mar 2020 04:01:04 -0000
From: "Jenny Chui" <info56@appletoncreative.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 18 Mar 2020 21:01:03 -0700
Message-ID: <20200318210103.0B7000904AA37F73@appletoncreative.com>
MIME-Version: 1.0
X-Spam-Score: 4.4 (++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.9 SPF_FAIL               SPF: sender does not match SPF record (fail)
 [SPF failed: Please see http://www.openspf.net/Why?s=mfrom;
 id=info56%40appletoncreative.com; ip=202.89.0.21;
 r=util-malware-1.v13.lw.sourceforge.com]
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1jEpay-008aZu-JP
Subject: Re: [f2fs-dev] Response
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
Reply-To: jennychui.comp@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good day,

 This is to inform you that we have a part-time  (Work from Home)
 job that takes less than 2 hour(s) of your time daily with a 5%
 commission and $2,100 monthly salary payment available for you 
in
 your region, please get back to me if you are still available 
for
 the work  to enable me send you more information.

Thanks
Jenny Chui  


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

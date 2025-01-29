Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8B3A22C5F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Jan 2025 12:15:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tdSVX-0003hW-Mk;
	Thu, 30 Jan 2025 11:14:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <celina.jones@quicklogowebsitedesigning.com>)
 id 1tdSVW-0003hO-GE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Jan 2025 11:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:
 Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3Re4ZyxmIjLjbC3kGNe4/eRd55jarqXuwjXB2zIetQ=; b=cnS09JbWNkC0itsbfIgBv/lTSI
 SB3qBp5BYTCUM8xM4vMlaFQU5ZePcV7dxCju+7Oaf0VUnmJjoftaIpyYmZtTVGYSehLnhtKXJICNT
 G5ETiUjK0oQ/U/6GuQPrWsgu+jJHca57w3CNSevmCM1RZloz1WrmW3VW+YZR1Ra3MoR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:To:From:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h3Re4ZyxmIjLjbC3kGNe4/eRd55jarqXuwjXB2zIetQ=; b=H
 mqMe8yMNGZNb9OMqJFlBgsIoNJiSV5igp37PfpZufG9P8UpaZBE/7OA5xkGE686fHyWa+77m0tPVX
 JTdtvjkwu5jqUrCADi1ksibpoXlBTI1ya699i9bA5ZH8UaXDS7HFguEsX2NxeQMt4gcTI5nafd7cf
 4oUhSE5fbhR02j48=;
Received: from [103.133.214.27] (helo=host.quicklogowebsitedesigning.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tdSVU-0001PF-DH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Jan 2025 11:14:49 +0000
Received: from quicklogowebsitedesigning.com (localhost [IPv6:::1])
 by host.quicklogowebsitedesigning.com (Postfix) with ESMTPA id 1E62C86D109
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jan 2025 14:18:28 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 host.quicklogowebsitedesigning.com
 1E62C86D109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicklogowebsitedesigning.com; s=202407; t=1738140508;
 bh=h3Re4ZyxmIjLjbC3kGNe4/eRd55jarqXuwjXB2zIetQ=;
 h=Date:From:To:Subject:From;
 b=Gt75uefcgXU4qfxUBqpE8XcBmg1T3wMHlc0HpUuqp60xc8Jj1QOhdKhA5REuBEetB
 o1TayOg6G5tMNNxW6JM4wdyZe5CT3kRJjtf7JU1de8ZS/VUUYhP6N6mvyXHHNuV0Y7
 SIeta1uEpO2n416rNkpQW3Rx9EjlNK+UHj/iyi+MInoy8WzICCabncrtbM4Rkpo0VS
 gr3dYuzwv8Ji1pB8cxfZttWhdb7LGF4SMrmZ3QqvoaGEW/6J0gskW2IIlpIDnHfDZT
 bzUG4xm/3f/RL5j93hdHBxB4XIAwGs3kf9qjyTiJVAtyeF5gIneaY7OB0siAvClwtx
 V8QbsBHmbzCXw==
MIME-Version: 1.0
Date: Wed, 29 Jan 2025 14:18:28 +0530
From: celina.jones@quicklogowebsitedesigning.com
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ee605d6be105fe302ba55f736f0fac30@quicklogowebsitedesigning.com>
X-Sender: celina.jones@quicklogowebsitedesigning.com
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, Are you looking for a transcriber / translator for
 transcribing your audios / videos ? Many researchers / students are not aware
 of who to reach out to get their research audios and videos transcribe [...]
 Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.133.214.27 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [103.133.214.27 listed in bl.score.senderscore.com]
 0.5 DATE_IN_PAST_24_48     Date: is 24 to 48 hours before Received: date
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1tdSVU-0001PF-DH
Subject: [f2fs-dev] Audio & Video Transcription / Translation Service at 70
 cents/min
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

  Are you looking for a transcriber / translator for transcribing your 
audios / videos ? Many researchers / students are not aware of who to 
reach out to get their research audios and videos transcribed with 
confidentiality.

  We have been working for university students across the globe for over 
10 years now and provide transcription service to students, researchers, 
coaches, news agencies / reporters, writers at a very reasonable cost 
and quick turnaround.

  Whether it's interviews, podcasts, meetings, or lectures, we can 
quickly and accurately convert your audio / video into a written format.

  Our rates start at USD 0.70 per audio / video minute for up to 3 
different voices in the audio / video.

  Should you be interested, please do feel free to reach out for a free 
sample transcript of any audio / video of your choice.

  In addition, we also provide service for logo / graphic designing, 
website designing and development or any kind of software development as 
well. Please feel free to ask for our portfolio.

  Regards,
  Celina Jones


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394BA83914
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 08:20:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2lGV-00015K-QD;
	Thu, 10 Apr 2025 06:19:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <uplinkr@airmail.cc>) id 1u2lGT-00015C-FD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 06:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yg9P03mgZ0Uh4VIiizNoch1XBcPXvxyyEmfsysD+RLk=; b=Vzd01lGDL3CMYKy0svsP5tNzo6
 eDVcZb1kx9MDRnd0QscNq+wymPkwv0K4j6s74J/frkC9YC22i/xRbkQMB9C50OSszC7q4UeZPUxNE
 DbHE2THSiOypntj/wBRONqYPOaksXnPhfK5lbUwXig1dhihruRDAeezjWJD+avUOqjt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yg9P03mgZ0Uh4VIiizNoch1XBcPXvxyyEmfsysD+RLk=; b=B2uy/nYNUGcsyLBpTWEYoz4wFJ
 bZhrruEMnx8mKEtFRtjxrxcd6C2Dtahxt5AEA2XIIESzsMfIH0tANdhCTMt+lFfNBJ3eCeK07eLo9
 jc+TZNSem7Wk7NhXr9hEePgrlKm0RFrdlMu+rAGmu5aR7GHz4324Q+4VtvKefDczfHeA=;
Received: from mail.cock.li ([37.120.193.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2lGC-0002tn-0z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 06:19:52 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1744265968; bh=d5jLUyhtz0Ln+gI5DCop2tayfc+9OiyHNafb9yueEz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nQvC9CNsBwI1rdZvnkpx9rOU+dlxci4WgKltnQkIbl37ziBEhiO8lHDLf/DfujX5u
 6/fIgNktSxTm+pMK5N75DeC0eXz+vnZzUjJgmJ1HFnaaw7Wa+HQjDKWPOr7MDCi1l8
 IOjvHuY7qfYRPIxuIhKofaYfNgnKcaWz80Z+/x93gcelnLk1Hn5e+s93iqekEPiroI
 fSQLqRLEZrrZ/puZrNet5Vq9KdLCvynDFdH2kXaBMfinWtv6a1d1ossLvUjtSHcVCk
 GnczWvQjxfrf7ch7ICIUVeGVCYcnz5fpwKXXu5uH2Oxzj/Qq3TGPEhCju5/EUWUcrx
 9PBGRgczB9HvA==
Date: Thu, 10 Apr 2025 09:19:28 +0300
To: Chao Yu <chao@kernel.org>
In-Reply-To: <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <80e1ae8eddff0536f09ca07e802fb983@airmail.cc>
X-Sender: uplinkr@airmail.cc
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-04-10 08:52, Chao Yu wrote: > I checked the log, I
 guess it actually seems pretty bad... I guess we > need to find out those
 file which has not been migrated correctly, and > try to correct th [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: airmail.cc]
 0.0 URIBL_DM_SURBL         Contains an URL listed in the DM SURBL blocklist
 [URIs: airmail.cc]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1u2lGC-0002tn-0z
Subject: Re: [f2fs-dev] Resize metadata corruption
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
From: uplinkr--- via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: uplinkr@airmail.cc
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025-04-10 08:52, Chao Yu wrote:
> I checked the log, I guess it actually seems pretty bad... I guess we
> need to find out those file which has not been migrated correctly, and
> try to correct them, may be w/ a new tool.

Hello,

The issue is the corrupt partition in question contains a lot of 
unbackupped, valuable data for me. I wasn't aware or informed of the 
potential issues resizing on F2FS has (the ArchWiki listed none) and as 
such recovery of this partition is a lifeline for me.

Could you please write this tool or a patch that I can try in fsck?

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

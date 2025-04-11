Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA6A8624F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 17:50:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3GeB-0007Pg-1T;
	Fri, 11 Apr 2025 15:50:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <uplinkr@airmail.cc>) id 1u3Ge9-0007PT-2C
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 15:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OY/S+JzqW9/wXLPitzWJ2GLQa4Bcb4V6wO/pxslivNA=; b=bYqL3e0TmoXKjVkbhXw4XVysMR
 UshMjCMf3j13wbVAAJ+SbHop9INjMl4zbjBounHiPNZTowiV5z7jrrN0tZYU94AKSNOXBUxbsXpNG
 FN7zISwxdBM14kv0vnhJa1HT7b6Tow8BxSN+izoPVLylGh/b9JiRE9u+/CLiLurVtokM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OY/S+JzqW9/wXLPitzWJ2GLQa4Bcb4V6wO/pxslivNA=; b=dpgwuxSP7wek02nD+9rDssVxgK
 PcRBKxOkAG2KlCy5PE8l9TMDWtGGtKTQDM2SKHjhDO2x7SEqyBArNRD5cmx/ABxAzqBFR9+xxq9ZG
 wh/FRPyCeowy7zTEGX7JcvED6F+q/cDJuOU9ndqYUQmgnHrFXwqut2XdQUoI23xtBNH4=;
Received: from mail.cock.li ([37.120.193.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3Gds-0001xl-Uc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 15:50:25 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1744386595; bh=YNA2f2YPzby/45jPGM3E2yHntDBXcyfQPqHeBs/8msI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RahUrMRwHdPQnMPhDKujPgrQJTdiSEgoqsCXoUtX7TdBPfwEZpd4D2c3JPI3n9I6a
 gBGDcPpAlYXLx1EsTzTeu/H+C0kTxtgj0QRBM09yQm3zWr5tMz2HyfAEEq034cHQkp
 or4RcKH/h0QUf1EdY/sqsQirzhbYkY/9MGd6g/eqlXOWtaO0Mzf2k7bcg/HhGqEIoc
 1Vy2uvtroNAH7mt/jBQDwYHElSN8j7ugbom+kgKyD0OPYPo+CkKSSpKNJy8gGH9JEY
 da733bRUrSnINRGfZkk/YW3h/MuCvy05iYzIs9/cDX6z8p8j2OeW2f+Nr/QoPz4Hyc
 MgV04uMI3+tMg==
Date: Fri, 11 Apr 2025 18:49:55 +0300
To: Chao Yu <chao@kernel.org>
In-Reply-To: <99dee2ef-d325-47bd-ae6e-c2af15fa6121@kernel.org>
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
 <80e1ae8eddff0536f09ca07e802fb983@airmail.cc>
 <46507541-7e11-435e-b57a-7ed945ddc182@kernel.org>
 <CAD14+f06qKLefutNfLFRC4ZbJ2wcn0r1TL3Qx95B14u-XokyZQ@mail.gmail.com>
 <99dee2ef-d325-47bd-ae6e-c2af15fa6121@kernel.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <e1a6b5ee756d5f3adb5e83bfd0db42ad@airmail.cc>
X-Sender: uplinkr@airmail.cc
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello everyone, I'm sorry to not have anything constructive
 to add, but I'm about as flabbergasted as I could be. I retraced all my steps
 (exactly as I went through with them before!) and was unable to replicate
 the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in bl.score.senderscore.com]
 0.0 URIBL_DM_SURBL         Contains an URL listed in the DM SURBL blocklist
 [URIs: airmail.cc]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1u3Gds-0001xl-Uc
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

Hello everyone,

I'm sorry to not have anything constructive to add, but I'm about as 
flabbergasted as I could be. I retraced all my steps (exactly as I went 
through with them before!) and was unable to replicate the corruption. 
On the contrary, the filesystem grew completely as expected.

After restoring my partition and backing it up, I ran fsck on it. fsck 
reported no issues with the data, so I pressed on. I opened up GParted 
and expanded it like last time. This time, however, I didn't end up with 
no "Mount unclean image to replay log" error, and the resize went 
through as expected. The partition mounted perfectly well, and when I 
ran fsck, it too reported no corruption.

I recall that the "Mount unclean image to replay log" error was present 
through reboots and live ISOs. Perhaps that's the culprit?

Thanks, sincerely.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

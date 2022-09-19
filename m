Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 616065BD08F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 17:20:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaIZQ-0004LJ-8H;
	Mon, 19 Sep 2022 15:20:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <info@gmail.com>) id 1oaIZO-0004Kz-VC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 15:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Reply-To:Date:From:To:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iaQQDP/YYZgfrXATEzVYjTWC25BNL45g4OasW4rv1io=; b=HDjWB4CTMHt4pm5FVsJT4ELbhz
 xS6Hh1to43g0Dn4EKS2gC1/sXuYmSIZCs+s4+xv/QJJK/EYZQutFq5Db7mRWt/zRecssYYtRDyT3o
 D3lzayXA8CvuOe27dsMXvxp41JtdAQdNGoYCDXgvm2muyiwAbJoUEtJUpk/4Yq3dyfUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Subject:Reply-To:Date:From:To:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iaQQDP/YYZgfrXATEzVYjTWC25BNL45g4OasW4rv1io=; b=ftq1hoMPMG9wAjQPeyzHIgU1GV
 a1s4A+NDbT4d81X99BuEahz0Xze6L5ruaUuYQqJWMq4T46vhk2BJ+KmLmz6dleImF3Owgg1vxSWMz
 bZb6YQLuGF4FPpmXdO/UWt7yp4xzL8foSZyD+uJSDIR2fLkGuaXjur8V2w70U5t7ftiA=;
Received: from cloud46308.mywhc.ca ([72.10.162.214])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oaIZO-00DU9I-BX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 15:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=webventure.ca; s=default; h=Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iaQQDP/YYZgfrXATEzVYjTWC25BNL45g4OasW4rv1io=; b=awH316I+VlGWzC76cYTHgXlytG
 Ob8s2VstcjeTtIXqyEQjIUsoDBTysPFTZtfIJy8RYzJhqAvOBg9c2Nq8KAbeEDVqAEDHnin5pmgyI
 IDFYKVhWjHxiE8WGO7EVF4hS/jH5F6khAkKqjv33Hs9+LIVTEcTSEY1CQvdqsE7goUHRQDhHDm6o0
 eWdBombl3cS5NLymjP7M/JOrSUL/Rd2Yv/aunvY4fCkgx/wGUrFnOnW7BoHP/M2V5yUOwNBNzpFJ9
 1HFRC/oFpO+jlLoUuZhado9UHaM7GSSmPMhpGdDnt1LlE7+X+iRCWv4kqaWw/1xlRhDdxr9SXR0yg
 xwepcqyQ==;
Received: from [154.65.84.66] (port=49930 helo=LAPTOP-TU40EMK7.domain.name)
 by cloud46308.mywhc.ca with esmtpa (Exim 4.95)
 (envelope-from <info@gmail.com>) id 1oaHvl-0007d2-HD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 10:39:33 -0400
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Christine Weir" <info@gmail.com>
Date: Mon, 19 Sep 2022 22:39:23 +0800
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cloud46308.mywhc.ca
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmail.com
X-Get-Message-Sender-Via: cloud46308.mywhc.ca: authenticated_id:
 test@webventure.ca
X-Authenticated-Sender: cloud46308.mywhc.ca: test@webventure.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Score: 8.1 (++++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Make use of this $640,
 000 donation offer from me to you. Email
 me for more details: I anticipate your earliest response. Christine Weir
 Chairman Weir Foundation/Trust Regards 
 Content analysis details:   (8.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received'
 headers
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [christineweir72[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.1 MISSING_MID            Missing Message-Id: header
 0.0 LOTS_OF_MONEY          Huge... sums of money
 2.0 MONEY_FREEMAIL_REPTO   Lots of money from someone using free
 email?
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing
 list
 0.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1oaIZO-00DU9I-BX
Subject: [f2fs-dev] [SPAM] Congratulations you won $640,000!!!!
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
Reply-To: christineweir72@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1oaIZQ-0004LJ-8H@sfs-ml-1.v29.lw.sourceforge.com>

Make use of this $640,000 donation offer from me to you. Email me for more details:

I anticipate your earliest response.
Christine Weir
Chairman Weir Foundation/Trust

Regards


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

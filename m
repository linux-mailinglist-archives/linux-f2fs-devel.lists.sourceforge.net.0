Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24AAA6132
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 May 2025 18:07:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kYUvXKAyr8NkhKNZOc2DF0T8j4oxkM5yTOvT79+u/OA=; b=VMEton16GnW2KW0hb6Ty9qpgkt
	U7Il5adv5oEdc38AR2wNoGlG2EraROFtppYJM1MJijKMykJdzofHrzl2Cz5Ongza1CiZn6hinPR9z
	amnlXmQQ2DHx2FlQWhjYD8YR9uaOTN5vIee0twDF9qBzgnf/FdgJ4EanGwfgCnfcu8Bw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uAWRx-0006Yf-4A;
	Thu, 01 May 2025 16:07:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <enquiry32@neodes.us>) id 1uAWRu-0006YO-MY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 May 2025 16:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1+ttT2vULfzHmBlvndDJAZr/55hJ2kIRc5/daH7tak=; b=XtqhmDZAOHNfgMYPQq7sY7gnJx
 n61YcfQROgymf7tkhvaSQD59KCHGNfowRvmkYBrIM32SEwM786wCQclP0Z9U7Gru7lON3MR2eY1YC
 2d2ckVgXoRtgQvakq5w1/bcqtCP+zmkQgyC0M0oGou2SaGFA1Egqb50ksilWcajO+fWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q1+ttT2vULfzHmBlvndDJAZr/55hJ2kIRc5/daH7tak=; b=W
 p0hnlyj1zQtoznYSNOx4kdgDZM9RhNIb44eu/YHes1YTk9ndOCSzaYCy3Amyu47cwUcCmlP2hEP8g
 1wq3QxmILb7J0JKB54/3EpNRuX5gcl1sDSHNwIktjgC29+3PoIe2/Ez68lC9VP0/EEBBSaXtYowHW
 bXjVy3ML7x8EtqSk=;
Received: from mta0.neodes.us ([5.149.252.27])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uAWRf-00071o-2B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 May 2025 16:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=neodes.us; 
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=enquiry32@neodes.us;
 bh=q1+ttT2vULfzHmBlvndDJAZr/55hJ2kIRc5/daH7tak=;
 b=N8nSrHxq5A+laqbh8uV0Ys4SSwZc8pSpS/kHL4baV+bGk9f2q+eeuLbv5yVwWd6XsC1TQLafq0DC
 RgHeST0oUXWe9LhZ05h9Dnw7iwPp8D16F+u4wsyaFiGSO8R5vQswQFjtCqoaZ5TAbmJXr+1xBwEN
 zF6WJryvpMI37qd1yt8=
To: linux-f2fs-devel@lists.sourceforge.net
Date: 1 May 2025 09:06:30 -0700
Message-ID: <20250501090630.97C138E6B8F16F77@neodes.us>
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello linux-f2fs-devel@lists.sourceforge.net, I'm following
 up to confirm if you received the purchase order we sent on April 17th. We
 haven't received any response yet, and I wanted to ensure it was delivered
 successfully. 
 Content analysis details:   (1.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [5.149.252.27 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [5.149.252.27 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 0.0 FSL_BULK_SIG           Bulk signature with no Unsubscribe
X-Headers-End: 1uAWRf-00071o-2B
Subject: [f2fs-dev] Follow-up on Purchase Order Sent on April 17th
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
From: Mary J Lynn via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: marylynn@niagara-solution.com
Cc: Mary J Lynn <enquiry32@neodes.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello linux-f2fs-devel@lists.sourceforge.net,

I'm following up to confirm if you received the purchase order we 
sent on April 17th.

We haven't received any response yet, and I wanted to ensure it 
was delivered successfully.

If you didn't receive anything, please let me know so I can 
resend it.

And if you're not in the sales department, kindly forward this 
message to the appropriate contact.

Looking forward to your response.

Best regards,
Mary Lynn,
Procurement Officer,
Niagara solution llc


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

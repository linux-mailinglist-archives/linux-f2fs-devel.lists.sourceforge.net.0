Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C332A4C929
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 18:21:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tp9UD-0004Et-9a;
	Mon, 03 Mar 2025 17:21:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1tp9UB-0004En-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ms474Fkjaj3ya8iT1IToTwuVBOxP1ecoS432F/DQxlI=; b=ItPBYfMzYJF63aThuwXAHHoVzR
 /MTh2LuWiDSaVPbWkXjgyWex7ge3iNVVtW7ABr2xF1p3aqSjtAIH6pE/gw/v14J/o3TTWet91V+zV
 VRZnSGGSSM587Vez57SnidWo11l8gBoV5xBx1v9DtIDOtzruIqw1rsJ/m4dAJRtIjVd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ms474Fkjaj3ya8iT1IToTwuVBOxP1ecoS432F/DQxlI=; b=Na2Cl5pacsUdye5CcEefqR+ZHJ
 0VkQNu6PV1vpH+3eNOZVgY/5+aKCUSLNj4Ldsi/QlzMVwkUJAMaz/cWcDrNs4BQpqFyWVNQ8Jt8zG
 bhH+8Hbz69y3RzQctMTwx0JPx34/V1YNzoCGXDszNWahBWpIGJf3E0f0TchrkxQnFzD4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tp9UB-0008QN-2h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 17:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741022501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ms474Fkjaj3ya8iT1IToTwuVBOxP1ecoS432F/DQxlI=;
 b=JfEh59ji6pHCsiC+kNaRg/mJJXFPn6YCJxDdZ9njgOUntHN4WJIIpBwOhvqlRWxcKyoAaa
 vlwhI+1kUv1rFyoyewXYFa7GRJ/eq2HRD6MoMo0nDl+1QbgJuNuZ4GT3kgCR++9NiFBpLF
 +ost25dyK0pIaGAsd/BMiNAblNdtg+M=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-_5BWCWJSOumy5C1zQ9wkoA-1; Mon, 03 Mar 2025 12:21:35 -0500
X-MC-Unique: _5BWCWJSOumy5C1zQ9wkoA-1
X-Mimecast-MFC-AGG-ID: _5BWCWJSOumy5C1zQ9wkoA_1741022494
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-85ad875acccso315988639f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Mar 2025 09:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741022494; x=1741627294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ms474Fkjaj3ya8iT1IToTwuVBOxP1ecoS432F/DQxlI=;
 b=dhSgAExZ8wjhrhEGytkhvdxLYlhbe4L3g/OPUYWlIY9i29fcXQC0//hDsMCromtibv
 zQbS+5Wqt263EqbX4IW0grZi/5zs+ZfjX50rGU+YL4h/nJwCpca7/wFglt18ttgoEqwT
 4EgIWYpOyO/huh61KF1PxdEsG+C2UT9yqfjHxiX/pMR7YegM1NafvDJPznmsJcjexHB+
 i2Vh1pHnTPOvsc0eFHG2lDFctCqQ+X6WIV+sBuACwAgZ5wJNoO9MGb7vn8NLnnqKWaH5
 U9Hi2mU+F7JvTD8MUb8+FKQH4vW1iKzyONuVc8T3LvjTl54de1IlXbX2ihq5ArjxGfKy
 gyXA==
X-Gm-Message-State: AOJu0Yyfrmb1Tv3gemRMNa/aYR7mSGXgFSRDul2dmhu1K/c5q/3du2Pj
 FyLy4QXxfkQEkwzjcABA/3Fa847dnYvXSchJ6gm47aCQm9Xq3oLYWX/TVBE5PJZdO1ZlH12C+pN
 ZliGMSQbbMGy+HAl8J43AkXEz6Two6fAxWM6smGOt1rtLwlibzW5KpNeMjFpigGIdoxKBqiy7pe
 WIUZ3T1j08LTaq6+yLVC9yrgKApWxLVV10E4p5AdTfqJyoKZW7Mhh47vGfbA==
X-Gm-Gg: ASbGnctjwPjpXwIubG2y9fl1TpQrYW1In3hy8TlzAy7FGQD8D16PEfz9ghEQyMMYzOA
 u27KBUZCJFwaRz2kvuiVMYXXAzsi0idWSN5VR8UP4h51Ho7ANnfipqGlxAtz91E6ZwFohxDfjTg
 rUA0C4Dr55/oeK+v5lFOkfFI3a5P7uw8einN1J49aur/NviQtb4yfmbtgWjxJgC0sLeQxkM/9PB
 UZ52zthCQd8sa1FjIPh1v83MLhrgrMHEU8+Avpz7WeyjTQFzJnbMzpeRQCSh40BakAgxVt3ANRt
 0td0krsdHv2crGb9R7RrZrG86aQOHYk=
X-Received: by 2002:a05:6602:640f:b0:855:63c8:abb5 with SMTP id
 ca18e2360f4ac-85881fdba3amr1465803439f.13.1741022492868; 
 Mon, 03 Mar 2025 09:21:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLg+dPHtzUuhlIl5+NdRK5VlJhpA45XNfYazemqa+5sRK2tzbtwcjAYy0M5Q1rfQqIa1bqBw==
X-Received: by 2002:a05:6602:640f:b0:855:63c8:abb5 with SMTP id
 ca18e2360f4ac-85881fdba3amr1465788739f.13.1741022491032; 
 Mon, 03 Mar 2025 09:21:31 -0800 (PST)
Received: from fedora-rawhide.sandeen.net ([65.128.97.82])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-85add261b4csm49563939f.9.2025.03.03.09.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 09:21:30 -0800 (PST)
From: Eric Sandeen <sandeen@redhat.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  3 Mar 2025 11:12:11 -0600
Message-ID: <20250303172127.298602-2-sandeen@redhat.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250303172127.298602-1-sandeen@redhat.com>
References: <20250303172127.298602-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MnvutL_9SWvyTGD9W_e095lHf-nnCuQ_s70AuiLIyuA_1741022494
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Rather than using F2FS_HAS_FEATURE directly,
 use f2fs_sb_has_device_alias
 macro during option parsing for consistency. Signed-off-by: Eric Sandeen
 <sandeen@redhat.com> --- fs/f2fs/super.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tp9UB-0008QN-2h
Subject: [f2fs-dev] [PATCH 1/9] f2fs: use f2fs_sb_has_device_alias during
 option parsing
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
Cc: jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Rather than using F2FS_HAS_FEATURE directly, use f2fs_sb_has_device_alias
macro during option parsing for consistency.

Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 19b67828ae32..dd35d199775a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -838,7 +838,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			set_opt(sbi, READ_EXTENT_CACHE);
 			break;
 		case Opt_noextent_cache:
-			if (F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_DEVICE_ALIAS)) {
+			if (f2fs_sb_has_device_alias(sbi)) {
 				f2fs_err(sbi, "device aliasing requires extent cache");
 				return -EINVAL;
 			}
-- 
2.48.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

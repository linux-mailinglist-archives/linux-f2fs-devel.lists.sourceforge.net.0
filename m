Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE19D9C8C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2024 18:28:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tFzMm-0005Ww-JI;
	Tue, 26 Nov 2024 17:28:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leocstone@gmail.com>) id 1tFzMl-0005Wn-Fz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 17:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2jdvil7J0bZhAA4aaOyViWI8sU7Jc49WXcGpRWqWHNM=; b=O9cYY34gYjNI58t/RiUI2MWeVR
 EAL7Xn9XIe/KD7f0nyFLeAhuMW017Ty1slEQCAf5KxyrGazA37nTEPMM6TLMiYMexhHuppdNa5ccc
 Xl42NA5uydmegEiBEbhnyU87QlfgcF0oBmbiuLt5qRrQusA5oucLrtYk2aIsecuWCBW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2jdvil7J0bZhAA4aaOyViWI8sU7Jc49WXcGpRWqWHNM=; b=JIDfTdVe1+cWnlOQ1FC4OqB/5C
 /IUd2xd8nY4RX10zJ8VSlwkWypsPV9PAEaMEuF+BA2kncPndr3xBE8HS/CQM5xRBJ4rLCehxbIjJs
 yQRxKISgaE0YTJKbHDqVtnBgohfo8qxTCRDbVxBBSEwYEOuQj4v2kbh4xu6V7cJI/6uc=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tFzMk-0004F6-UW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 17:28:47 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7252f48acf2so82482b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Nov 2024 09:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732642116; x=1733246916; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2jdvil7J0bZhAA4aaOyViWI8sU7Jc49WXcGpRWqWHNM=;
 b=NKNWi0EGEjR2TMJIv++LkFzQY1I4V8Q7+v+sip2wCi+nRPRUinqpqqCCyzoC0k6CXx
 UESZzbyl5rTfabJIGek3ei1K1FHSS9gFYpiwPiYb0jyZNdLZ2L6OPXdno06sUgyaGwGc
 oftTAr68wtR41hXHAjRB4C/dzAgOQHIhLE3mLP6yqBdGGobaq8IA9152vklmWy8YpEnf
 NtgAxDZsVQm6V/hW1Fajv7FZFRdnmpGbWy28F4oNIMF81Uy1LO5GZqNYkGLi+cXtmKy0
 pT2TRMJVQWl1MZ9n2qTI4omZujxdjYtAzjk/hWpoN+MU4mZ/2tzd1XITxekKkHZz2Crl
 +TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732642116; x=1733246916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2jdvil7J0bZhAA4aaOyViWI8sU7Jc49WXcGpRWqWHNM=;
 b=OgxlH7WoEJP3xlzu0Dh/Dzq6gW9DPFCiakP1AqJfmVp/Skr96ovPg/SSrVXCsXGfZA
 1Atgsg/ChMVolkPIR9T5lof558XJ0ZLo3iSP0znY/FDlXpoH+mbkJcirwK1SUoCp+kAP
 QaMyDO/lkk4HJXC5Snk5Pu/RZ9RpBSQKHQ1u+/RnWRdb+zz+bJI+D/05Tz1FLIkzYxMc
 TyBwuX8NzgNde31+MbfLgzcvxzBIvsRtO0KkBoxXd27skJjJqBy7q/ry4lVbYYphNms8
 g3uaeSh2Ws99JNmxiYLVnQFpZLQ6ZSdpk20Aa3kNT6ucK8PI6GTOK9qEw/+Zgefx0po/
 2Nyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK17VyxyDkg6C0zfaXKx1Ai0y8cfuKWcqdFWTQXBRgxp/FWA8Ao/chqgUWHk8xfBqd1ZGAGq3AYGsVtt6qM7Vt@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw1N2xCsC2rY3BwXcN/HRhU10OjaOBdvkNA/Pz1k0yMgPlohfJd
 DT1r98tHt888E3B5ydkpiMOW5uPmroRXNw7lvuNy6yS53j02oBfY
X-Gm-Gg: ASbGnctAGOnJGUbjBTGF6Tf9HLUAb69cAZ8bXS04tbAkALnzsYbUwtHAvJWCiYvRg/+
 ft4GQ3xDxUPRdeOWwNaoqqGNlAjzDj0dCCCIvklhUvfuMO/L376T3reH8tLQL/AhtAZQeOFi8+r
 +fonyh/19rlkni3YO6ZHyKrJ/q9CUsm2vufdB4Mx+tCIpUxoyRPYeihFrKhS2Pxuq7cm1pK+sDX
 p964m8ruaGtkZkMGKELyvLJrdvM1L17lSiMXftUwJARHqQI6rJTpuQGH89LZajwjQ==
X-Google-Smtp-Source: AGHT+IEYbOFZv4S1J8DJ8sJmOXBTQ14kgVvt8ItV0Izei3KknmQuhhpcmuVRc8pbsYQFvCRP/m8BSA==
X-Received: by 2002:a05:6a00:1390:b0:71e:7174:3ae with SMTP id
 d2e1a72fcca58-724df5ed802mr21202721b3a.11.1732642116324; 
 Tue, 26 Nov 2024 09:28:36 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:3e9e:9bc4:e80c:2141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724e8852fe8sm8013211b3a.187.2024.11.26.09.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 09:28:36 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com
Date: Tue, 26 Nov 2024 09:28:34 -0800
Message-ID: <20241126172834.78149-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67450f9a.050a0220.21d33d.0003.GAE@google.com>
References: <67450f9a.050a0220.21d33d.0003.GAE@google.com>
MIME-Version: 1.0
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This looks like the same image with a deleted inode as in:
 https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83 #syz test ---
 diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c index
 1ed86df343a5..65f1dc32f173
 100644 --- a/fs/f2fs/inode.c +++ b/fs/f2fs/inode.c @@ -372, 6 +372,
 12 @@ static bool sanity_check_inode(struct inode [...] 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.171 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.171 listed in bl.score.senderscore.com]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [leocstone[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
X-Headers-End: 1tFzMk-0004F6-UW
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_rename2
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
Cc: yuchao0@huawei.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This looks like the same image with a deleted inode as in:
https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83

#syz test

---
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1ed86df343a5..65f1dc32f173 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -372,6 +372,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		return false;
 	}
 
+	if (inode->i_nlink == 0) {
+		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
+			  __func__, inode->i_ino);
+		return false;
+	}
+
 	return true;
 }
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC49E098B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 18:13:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tI9zR-0007LZ-C9;
	Mon, 02 Dec 2024 17:13:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leocstone@gmail.com>) id 1tI9zQ-0007LS-Mi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 17:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSXLTpDA/M62S+I3gxA2SYgTP4kesEn624cEHGxP9PE=; b=BEmjh5RqvBdbUYPgmMq7nRNXNX
 FGwJRscGDzmnVwQ9o/Vvt6GVzesKsgTnzzpRgUtwxZDHf+9G2VZ+/lIfSRV0LUMWLxnakb0m2tb0c
 9D5NN7rsf0K8X0pnsJou3OHbT+tuZH/VCRTW4bzUcVx56RTr9EazwUjGkcGYWToxWboE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OSXLTpDA/M62S+I3gxA2SYgTP4kesEn624cEHGxP9PE=; b=Y
 dIIAvHBBRcPgppOCl0ClMmudOJ1SYWT9uIsj76eQa0PjYmCjRUc4uAvvgxKVj1bZUUbaXN6+JJSd9
 xAH57wkT/YLys9xzP62MYHC/BmDOcxiXIn9K4L0NGYU9TqU/5RkT5yXRd6xzyvR6PnnUyVuGbaVnE
 O3BX7eK7JaZwkroE=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tI9zP-0006yB-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 17:13:40 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2156e078563so14254045ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2024 09:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733159609; x=1733764409; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OSXLTpDA/M62S+I3gxA2SYgTP4kesEn624cEHGxP9PE=;
 b=lBYAmVvk4ccRl8qHpFOhM7M2e+Onkm+sQd2MjFkoR2Txth3Vsl7chE5cn/YOQBlOdZ
 01p6U/GrqW/8Dip5WOe3z+p3fuV0fS48oL1BzyzZhzP9lYWgXh0q37trcTG77Iah+b3A
 WcBXJwVGeC7ge2SuIc2w7rRcRv+BX9quFze9BX+YkMT8gL4w6hRtrmlBTR/+bBNoVXC0
 HlTZJ9OfY93aQy/Cx46fIvJsffL4bE3+82h6mo8ocexbVXhRMHERXCpL5l2DYUhbH1nJ
 rL6tdLa8p2YZUyn6qbJUmKCwXYvIrK9Hiid12IapA0IffuqHAg2rsHe3QUspfa1uAoIv
 bdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733159609; x=1733764409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OSXLTpDA/M62S+I3gxA2SYgTP4kesEn624cEHGxP9PE=;
 b=lr7NY+sYLbjKh0gjtu27Olebja0/DqD5PlGjDAGeRFDNw0SjzpVbZRoExYeM0ay3O3
 3Xx850Wz9mgu5lJgiUFiis+qLD16uisFyc/A8UfU+H9H8aVqN1hXnlr4WIjc/5t0cfkB
 8pydOZCfGW5kPsvgi2jZR32qQgyr9sj+l0UvJ4do0+3Lj9iBoFemWoTjOxCwcWOyra9N
 ip8iJiyq3Og58+uvwSJeht1HXWDGE3HNnMoRCUA03n99+6+QHcCrNaT5v1oifqFpoS5w
 L+v7AHCKTVOCkhAuIJSs0jB69cmMFuLvII2XoFLeLrjElGzVGbaKVr7ZXoUklXjTe8lU
 fvjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/cIO+FS7PHiImiG7Cw0wkDsRNSPzSABUN2W7T+MFA9hGyluaeR2AgF7/yJNlhfLQRyTvCj2SmbVv6YFOOowY+@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywa2HhxLzs5C14b3D9L4W0RD7fN5yfdMtp/xLPr4xb9g6cCuRbx
 jcnScl/shcY+y01cdfMr8ghVf7T/z/+SS4BytWqc86Km2qNkyJEM
X-Gm-Gg: ASbGnctJD/t06XgrLU3u/4W5n18n7Rl3P/fa4P2HuLouBj9+hPkDrukQB3mjsxEyrL6
 0DS5P2ypQsfTYHs5zv1Qd+VKsViH92ZY1jqFU5P0Q4Jz+nAcCUU2+Lr1KpcTppiDCSlUVXSILBw
 fuapFyrZVX4FRv6KtzCgJzaLZQn4m0Ynsi53YcMgfthN+wMorV48Yr1RGgvqFN48Wxel71KgX7H
 C4l780YnrwtTSiNhQxDFt6Z3Io7k/BQtgOi+Mw/gL+xSwAH3/S/u4Nlgd6HFALj0Q==
X-Google-Smtp-Source: AGHT+IFyyLkrtgvBDjiSILUMaQ69Swp9YJAshtY0HH5UUNEtNq1jezU8L8bDPPQJXsSn9Cf2tSLlxg==
X-Received: by 2002:a17:903:32cc:b0:215:7ce8:1364 with SMTP id
 d9443c01a7336-2157ce8163fmr86388125ad.13.1733159608660; 
 Mon, 02 Dec 2024 09:13:28 -0800 (PST)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:c94c:7774:ae6d:31b7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215a17a7be1sm15387425ad.255.2024.12.02.09.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 09:13:28 -0800 (PST)
From: Leo Stone <leocstone@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon,  2 Dec 2024 09:12:38 -0800
Message-ID: <20241202171304.5430-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The syzbot reproducer mounts a f2fs image,
 then tries to unlink
 an existing file. However, the unlinked file already has a link count of
 0 when it is read for the first time in do_read_inode(). Add a check to
 sanity_check_inode() for i_nlink == 0. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.169 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [leocstone[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.169 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tI9zP-0006yB-Fv
Subject: [f2fs-dev] [PATCH v3] f2fs: Add check for deleted inode
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
Cc: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Leo Stone <leocstone@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The syzbot reproducer mounts a f2fs image, then tries to unlink an
existing file. However, the unlinked file already has a link count of 0
when it is read for the first time in do_read_inode().

Add a check to sanity_check_inode() for i_nlink == 0.

Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
Signed-off-by: Leo Stone <leocstone@gmail.com>
---
v3: Correct "Fixes" line again. Sorry for my confusion.
v2: https://lore.kernel.org/linux-f2fs-devel/c0998223-6141-40e1-be08-d79bfc28eb0a@kernel.org/T/
v1: https://lore.kernel.org/all/20241124010459.23283-1-leocstone@gmail.com/T/
---
 fs/f2fs/inode.c | 6 ++++++
 1 file changed, 6 insertions(+)

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
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

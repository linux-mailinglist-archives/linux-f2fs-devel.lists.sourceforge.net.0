Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE8D5FEB12
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 10:50:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojGOd-0006wP-4j;
	Fri, 14 Oct 2022 08:50:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hrkanabar@gmail.com>) id 1ojGOI-0006tD-UN;
 Fri, 14 Oct 2022 08:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gi1PiA14Xvf0/+DfXuVtXD45G5BgebCQf9p57BfhR6s=; b=OTUXksm3JLO661CIo09R23K6K9
 551u9NFKgGkocPyiPMjSwyXGlpLhpAnZxXk3rgljXMiE4RRQFrP+XUvGS9lBZQEgR2mUE+WfweiRI
 K18+jWRJnxaVuDnayrtjDf5MB9AH8B3oBLbOia32I8Qg5heDtFetLZaby776SiQLnuiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gi1PiA14Xvf0/+DfXuVtXD45G5BgebCQf9p57BfhR6s=; b=BKyDcfKxFjVw7EVpGlSVtUVojO
 epRv/MdqsJ/RHQDf/S7UjMWE7XPsANTXGz5pxkksQfQ9CIkoPzyfHt+mbS4NBzZZ9N2gVKdqk2WJd
 F5Ez4EHvM6c1Ki8jaKEQq1dYf7ivvk9QbgqstgdvfgEQJwEKZ1ZjkoWNyn2h27ZY5Jhk=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ojGOE-003OLf-5s; Fri, 14 Oct 2022 08:49:59 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so3060569wmb.3; 
 Fri, 14 Oct 2022 01:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gi1PiA14Xvf0/+DfXuVtXD45G5BgebCQf9p57BfhR6s=;
 b=UxT7gVP8q9ze5Ggh2xvvktN6Ml02oBmfbyNFVTxcbcy6qgnZqVwI+fd54u0LJL+LjK
 y9EfYIAWCha0O2HVLdo55pAxb/IFOyVB4eHwuuXfLb3Q+WnwPgMtjSKPzu2oQKEhgIW1
 8w0WFdRg+RSJnOotAcs1Y+eSeMLVjAcWDFJda2lYZblubtGGGkakV9MIfwsDN7apZ3yC
 Rg00X0lJRAafbj8ZJHp9DjnqhMJlcm3+NYiLzY/y+FmG8gOcaLVVoEvJhhCVshISMbUn
 79bKI/g91GDk/8Ucsg8DPhwD6is+bLLgsNqiPgi18MPBUAdCAjxbT3q7n7tlSgWXhmL1
 RzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gi1PiA14Xvf0/+DfXuVtXD45G5BgebCQf9p57BfhR6s=;
 b=k8DIg8RRpq4OUBJq0KuhZp6ToQu3s0TcGNtF0Rc2YmGWOhUiOy4V5TpKYP77B9nZC4
 BBWFB/MqbYdRK+KKjOiM3eGCAWRUIxyBfRzShEPhRm+7C9OnP4aRoMF+5TrsHK9AU5uG
 x2kVB5SYW54HCSBYkEgkCb/MRrROl0pwgKwaNSj+DG+tBtyngaWubyPXdSFxQQjHiO6A
 jkhU7JCnEEUMs4AKh+2mQIIZAfzFZWhPrpjGeU4CcQ9klHvgTnZFA/kijFseU8jXdv4c
 HWnsqksZyQP4/oH0hbfVWY9b45X2rrWQL3hEVX3QctswpfUjJIeMxOGrvc/g+N5j+20g
 i+Dw==
X-Gm-Message-State: ACrzQf1MdLAMKBhg2GE91Iph/1yh+aKF0TaE6d51qUNlegIfKgWi6PyF
 lvBPdEAXqxdBKiYlmtbDHCQ=
X-Google-Smtp-Source: AMsMyM4fbdkajcL2g53Tyvy1JDbblSDeQm14FaYqXK6zLbEPkMD7/YmebYTcS//ZYjYNy+t3nI8G6Q==
X-Received: by 2002:a05:600c:3044:b0:3c4:8af4:ecc5 with SMTP id
 n4-20020a05600c304400b003c48af4ecc5mr2758757wmh.52.1665737391668; 
 Fri, 14 Oct 2022 01:49:51 -0700 (PDT)
Received: from hrutvik.c.googlers.com.com
 (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003c6c4639ac6sm1547372wmz.34.2022.10.14.01.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:49:51 -0700 (PDT)
From: Hrutvik Kanabar <hrkanabar@gmail.com>
To: Hrutvik Kanabar <hrutvik@google.com>
Date: Fri, 14 Oct 2022 08:48:35 +0000
Message-Id: <20221014084837.1787196-6-hrkanabar@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221014084837.1787196-1-hrkanabar@gmail.com>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hrutvik Kanabar When `DISABLE_FS_CSUM_VERIFICATION`
 is enabled, return truthy value for `xfs_verify_cksum`,
 which is the key function
 implementing checksum verification for XFS. Signed-off-by: Hrutvik Kanabar
 --- fs/xfs/libxfs/xfs_cksum.h | 5 ++++- 1 file changed, 4 insertions(+),
 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [hrkanabar[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.53 listed in wl.mailspike.net]
X-Headers-End: 1ojGOE-003OLf-5s
Subject: [f2fs-dev] [PATCH RFC 5/7] fs/xfs: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, kasan-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Anton Altaparmakov <anton@tuxera.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hrutvik Kanabar <hrutvik@google.com>

When `DISABLE_FS_CSUM_VERIFICATION` is enabled, return truthy value for
`xfs_verify_cksum`, which is the key function implementing checksum
verification for XFS.

Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
---
 fs/xfs/libxfs/xfs_cksum.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_cksum.h b/fs/xfs/libxfs/xfs_cksum.h
index 999a290cfd72..ba55b1afa382 100644
--- a/fs/xfs/libxfs/xfs_cksum.h
+++ b/fs/xfs/libxfs/xfs_cksum.h
@@ -76,7 +76,10 @@ xfs_verify_cksum(char *buffer, size_t length, unsigned long cksum_offset)
 {
 	uint32_t crc = xfs_start_cksum_safe(buffer, length, cksum_offset);
 
-	return *(__le32 *)(buffer + cksum_offset) == xfs_end_cksum(crc);
+	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION))
+		return 1;
+	else
+		return *(__le32 *)(buffer + cksum_offset) == xfs_end_cksum(crc);
 }
 
 #endif /* _XFS_CKSUM_H */
-- 
2.38.0.413.g74048e4d9e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

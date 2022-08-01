Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843E5866EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Aug 2022 11:39:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIRtA-000363-3B; Mon, 01 Aug 2022 09:39:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <studentxswpy@163.com>) id 1oIRsd-00035f-9T
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 09:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aUlPur86Uq5+zhGr0WKOjZ356tSLa5JuFMCfmHLR1uA=; b=efpk+k+CLRTJf2qicGN1iUXryS
 dkKicZ2Xa4fNZd01+nnP22BkD0r2yFK56htsNgaF/yfMda6mvUI1tfPZKT8z1XhyMKpC7q1up5O1v
 nm28svRCI6kUs4zmIA+sE+vFhpjB2qDPKNyPu5zzpo/qqBbbyVVwQD26GSyQ+Da8LKgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aUlPur86Uq5+zhGr0WKOjZ356tSLa5JuFMCfmHLR1uA=; b=D
 qn1tBEzXKX3QqZEUkiAMSoWVBSkn32gvOKM25AwewWfXQDXnaPKrYhHfhq1sjIhGtFzX1CRLxzZBJ
 R+TywwKtAeMfaQBfm0Ss/s/MHf/toe9UMRmJvEFROHgg4VPG09PNg3T3tdkSNEm00zFG/ArHXQ79G
 Y6bPw4GzsjII48Ck=;
Received: from mail-m974.mail.163.com ([123.126.97.4])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1oIRsb-0001X6-6l
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Aug 2022 09:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=aUlPu
 r86Uq5+zhGr0WKOjZ356tSLa5JuFMCfmHLR1uA=; b=lMsIuqNOTVuG/f1PeVWI5
 VhbKZwX3T/ymV/gf2IKIp52lKWoRwexHpUYyDANv1BrD4HY3u73e4WWZ0j0Yj/fS
 IV/8M6aPmrezVY9NNcW34BL7cXTbV0AjmI29E95T4+69/0gdxTzY3JXyUUtvxHha
 7h/E5Xpago5amflLhlgF4w=
Received: from localhost.localdomain (unknown [123.58.221.99])
 by smtp4 (Coremail) with SMTP id HNxpCgB35+M_m+di06X6SA--.6070S2;
 Mon, 01 Aug 2022 17:22:09 +0800 (CST)
From: studentxswpy@163.com
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Mon,  1 Aug 2022 17:22:02 +0800
Message-Id: <20220801092202.3134668-1-studentxswpy@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: HNxpCgB35+M_m+di06X6SA--.6070S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xry5XFW8trW7ur4rCr4DJwb_yoWfGwc_Wa
 48J3y0kry7JFZ3K3srCa9YqFyqqw1rJrn09FyaqF43K34rWrW3W3ZruF13A3y2vrW8Wry3
 Crs5XrWjyr17ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1IzutUUUUU==
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xvwxvv5qw024ls16il2tof0z/xtbB3wlQJGBHLN29uAAAsx
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Xie Shaowen replace kmalloc with f2fs_kmalloc to keep
 f2fs code consistency. Reported-by: Hacash Robot Signed-off-by: Xie Shaowen
 --- fs/f2fs/dir.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [123.126.97.4 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [studentxswpy[at]163.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oIRsb-0001X6-6l
Subject: [f2fs-dev] [PATCH -next] f2fs: Replace kmalloc() with f2fs_kmalloc
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
Cc: Hacash Robot <hacashRobot@santino.com>, Xie Shaowen <studentxswpy@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Xie Shaowen <studentxswpy@163.com>

replace kmalloc with f2fs_kmalloc to keep f2fs code consistency.

Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: Xie Shaowen <studentxswpy@163.com>
---
 fs/f2fs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d5bd7932fb64..712b51f69c04 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -232,7 +232,7 @@ static int f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
 		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
 			return -EINVAL;
 
-		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
+		decrypted_name.name = f2fs_kmalloc(de_name_len, GFP_KERNEL);
 		if (!decrypted_name.name)
 			return -ENOMEM;
 		res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

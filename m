Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89B9047BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 01:41:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHB6r-00073p-Qp;
	Tue, 11 Jun 2024 23:41:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jtp.park@samsung.com>) id 1sHB6p-00073P-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jun 2024 23:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74Fj9jhW/qtaTFXZgFUJGCh6q3BvT22VhR25YmB4vQk=; b=BEEkivjgxZc6JvxumfhsjSHaIt
 SKbnmY3ByqbkIOqIJkSQ8I6RxlOtwZBdWmFSNWHgIE/5tc59//Ejx5Mn1XylTHDuMYRtgW0clhrxg
 kPJF2YrZmVoiZYtgYKNGh44o+XJtlQTK9UpjkjgleW5RIfkdLcknEFiM+4TFoRchDMps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=74Fj9jhW/qtaTFXZgFUJGCh6q3BvT22VhR25YmB4vQk=; b=E
 rByqk+ozB03acyx2IVkJrOmpzwhK7wSWYsXV9Y7hIvJvZ0L84/qcLWJlJG0ByA2XvX3WCQyOgFUzL
 bQWaHOZojXSIB0eq8eLhW4aepVDUBxc1bTkmSOnjP/iqIUicjCUtMHQF4Ht+0xFb1PW5eknFBFekv
 G49bsN6mRJdQZCsc=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHB6p-0003TB-N9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jun 2024 23:41:01 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240611234051epoutp039cf1198ee884c1f96d74dd916f54991e~YF6QiDH_j0075900759epoutp03T
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Jun 2024 23:40:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240611234051epoutp039cf1198ee884c1f96d74dd916f54991e~YF6QiDH_j0075900759epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1718149251;
 bh=74Fj9jhW/qtaTFXZgFUJGCh6q3BvT22VhR25YmB4vQk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=vP590siozqTxILKIRrv4D07NA3vjnuv4wy+czGXOrGbDhT2RbNjvypYaRO8XQ9m1w
 s4D/1NIJESCaLmVEA4hZrI3qMbpHueVufLmCe3ab64NuYguf066t6z6WNPXIkE/gyW
 xeiHpSE8Hat97fyN5mVAXf8noxveQhiGnwq/GmGc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20240611234051epcas2p4c24ebb63b8ae1597dec7ffb79dcb4264~YF6QNRlKS1743917439epcas2p4z;
 Tue, 11 Jun 2024 23:40:51 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.102]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4VzQCk6GgXz4x9Q5; Tue, 11 Jun
 2024 23:40:50 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 B2.03.09848.280E8666; Wed, 12 Jun 2024 08:40:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20240611234050epcas2p40bd72d91c6a7b67e411a5ebfcddbcb97~YF6PlFaAI1442014420epcas2p42;
 Tue, 11 Jun 2024 23:40:50 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240611234050epsmtrp20a04c87479aa5080a415b30d9620c193~YF6PkaQ6E2100521005epsmtrp2P;
 Tue, 11 Jun 2024 23:40:50 +0000 (GMT)
X-AuditID: b6c32a45-447fe70000002678-fe-6668e0825d63
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 47.D1.18846.280E8666; Wed, 12 Jun 2024 08:40:50 +0900 (KST)
Received: from luwak.dsn.sec.samsung.com (unknown [12.36.212.92]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240611234050epsmtip1c2bae8a7a0eec55d713c7a7e5380072e~YF6PaAKYF0718907189epsmtip1_;
 Tue, 11 Jun 2024 23:40:50 +0000 (GMT)
From: jtp.park@samsung.com
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Wed, 12 Jun 2024 08:39:06 +0900
Message-Id: <20240611233906.2873639-1-jtp.park@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7bCmhW7Tg4w0gy8nDCxOTz3LZPFk/Sxm
 izNnX7JaHFl7lcni0iJ3B1aPnbPusntsWtXJ5rF7wWcmj74tqxgDWKKybTJSE1NSixRS85Lz
 UzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA9ioplCXmlAKFAhKLi5X07WyK
 8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjNmvbnGVrCCt+LUuzNM
 DYzvuLoYOTgkBEwkuvZKdTFycggJ7GCUuPcwtYuRC8j+xCixcekrNjine+0BFpiGtSfdIeI7
 GSXaDy5ihXC+MUqc2D+VHWQUm4CUxLXnh5lAbBEBe4nP36+zgNjMAtUSK98eYwaxhQVsJT58
 f8oKYrMIqEq8ufQGrJdXwFri4Y+NYHEJAXmJmZe+Q8UFJU7OfAI1R16ieetsZpDFEgKb2CUm
 LJ/HBNHgIjHr8R1mCFtY4tXxLewQtpTE53d72SDseoktnf1QzRMYJc69vsEIkTCW2DL3FBPI
 m8wCmhLrd+lDfKwsceQW1F4+iY7Df9khwrwSHW1CEI1KEvOWzoPaKiFxae4WKNtD4t6T/WDl
 QgKxEifWpk5glJ+F5JlZSJ6ZhbB2ASPzKkax1ILi3PTUYqMCQ3iMJufnbmIEpzst1x2Mk99+
 0DvEyMTBeIhRgoNZSYT3TEx6mhBvSmJlVWpRfnxRaU5q8SFGU2DwTmSWEk3OBybcvJJ4QxNL
 AxMzM0NzI1MDcyVx3nutc1OEBNITS1KzU1MLUotg+pg4OKUamCYfn2Q3cembtsM2ISFm0j/+
 bheuaX7/8klKvMxenjUefa+vm31aN2F19XyL+G1dm1NXL5a6z9QXnepX8kaEUclollTQlxmM
 M8Kn7/T5KeH+VLHiXN6azMpJCQvPd07Mev3Dg1X6nam7ffZmi4S6pz3VzNOr2rulZrxaFJ+8
 fM2tfW7xBkpv94czLFS56rpqkcCW65U+/eretw8c9lxy81NSyduf7+04rh5oXD9leufzCof2
 81kGJV2er+U2Xtw1y4f/i81O/ulFe9kLPKccLP1lJ3zJycN4tsg8toOZc+Z2ZsnP8OHa0BNx
 7Vzezs6o9xG987T454uyC+x1P/RbvzlA5ms6f7T79eesh9ilPyqxFGckGmoxFxUnAgBUY5cK
 AAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsWy7bCSnG7Tg4w0gxlHpCxOTz3LZPFk/Sxm
 izNnX7JaHFl7lcni0iJ3B1aPnbPusntsWtXJ5rF7wWcmj74tqxgDWKK4bFJSczLLUov07RK4
 Mma9ucZWsIK34tS7M0wNjO+4uhg5OCQETCTWnnTvYuTiEBLYziix6/ZKxi5GTqC4hMTyDS+Y
 IGxhifstR1ghir4wSnyZc54FJMEmICVx7flhsCIRAUeJX68XsYLYzAK1Ers7X4ENEhawlfjw
 /SlYnEVAVeLNpTfsIDavgLXEwx8bWSEWyEvMvPQdKi4ocXLmExaIOfISzVtnM09g5JuFJDUL
 SWoBI9MqRtHUguLc9NzkAkO94sTc4tK8dL3k/NxNjODw0wrawbhs/V+9Q4xMHIyHGCU4mJVE
 eM/EpKcJ8aYkVlalFuXHF5XmpBYfYpTmYFES51XO6UwREkhPLEnNTk0tSC2CyTJxcEo1MBX7
 Lz3ILDdZq0ZW2F5g086Z304ucX+75L9U9NLzSknfTNWTi5pFJ3EfX29SfErmDqeP5dGvWdPb
 ajY9PzVhs3Vcd2r49mfVdw6oLPj389Wkq/opvh0uHEwz8jsSzldW8YgoPuku/5px04clWr29
 sGTtDlXunDs6/fGmRqlbN6y33TqrVeo84wOV1AtHM9Y+VU/xX1j8/83itdvUV3z/0B+0Y9qi
 5uu3E5+FdW6Y9UD/3SnBsz+ETPPczXtvKeeeDjm8c7HqyzVPNFd5Gmg45ly8Jlhoov08ub9O
 4/IV12BXdVm1O6vfB19Z53BpFft2237rmwzGQlJry7+yyBo0t2mGv3qzd56muzBjwrbZE5VY
 ijMSDbWYi4oTAVyGgGOuAgAA
X-CMS-MailID: 20240611234050epcas2p40bd72d91c6a7b67e411a5ebfcddbcb97
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240611234050epcas2p40bd72d91c6a7b67e411a5ebfcddbcb97
References: <CGME20240611234050epcas2p40bd72d91c6a7b67e411a5ebfcddbcb97@epcas2p4.samsung.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Jeongtae Park <jtp.park@samsung.com> This patch adds
 a new scope based f2fs_putname() cleanup to reduce the chances of forgetting
 a f2fs_putname(). And doing so removes a goto statement for error handling.
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.33 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHB6p-0003TB-N9
Subject: [f2fs-dev] [PATCH] f2fs: add scope based f2fs_putname() cleanup
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
Cc: Jeongtae Park <jtp.park@samsung.com>,
 Jeongtae Park <jeongtae.park@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jeongtae Park <jtp.park@samsung.com>

This patch adds a new scope based f2fs_putname() cleanup to reduce
the chances of forgetting a f2fs_putname(). And doing so removes
a goto statement for error handling.

Signed-off-by: Jeongtae Park <jtp.park@samsung.com>
---
 fs/f2fs/f2fs.h | 2 ++
 fs/f2fs/file.c | 8 +++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1974b6aff397..284024c12ee5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3402,6 +3402,8 @@ static inline void f2fs_putname(char *buf)
 	__putname(buf);
 }
 
+DEFINE_FREE(f2fs_putname, void *, if (_T) f2fs_putname(_T))
+
 static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5c0b281a70f3..c783d017ed28 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4511,22 +4511,20 @@ static void f2fs_trace_rw_file_path(struct file *file, loff_t pos, size_t count,
 				    int rw)
 {
 	struct inode *inode = file_inode(file);
-	char *buf, *path;
+	char *buf __free(f2fs_putname) = f2fs_getname(F2FS_I_SB(inode));
+	char *path;
 
-	buf = f2fs_getname(F2FS_I_SB(inode));
 	if (!buf)
 		return;
 	path = dentry_path_raw(file_dentry(file), buf, PATH_MAX);
 	if (IS_ERR(path))
-		goto free_buf;
+		return;
 	if (rw == WRITE)
 		trace_f2fs_datawrite_start(inode, pos, count,
 				current->pid, path, current->comm);
 	else
 		trace_f2fs_dataread_start(inode, pos, count,
 				current->pid, path, current->comm);
-free_buf:
-	f2fs_putname(buf);
 }
 
 static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

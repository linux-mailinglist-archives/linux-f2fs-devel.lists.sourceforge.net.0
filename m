Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ABA5320DF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 May 2022 04:22:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ntKBr-0004ga-Tm; Tue, 24 May 2022 02:22:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sj1557.seo@samsung.com>) id 1ntKBq-0004gQ-S2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 May 2022 02:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ySh4VBTwTZYqs5uHmfByRcOgkoy7vH0TFw3CRIHx+K8=; b=lV9iZoHenhcVmmP709rvQB5TQz
 qvQXzvWYw3jKuHcF9q8ErHFyuEnQ54vdIMeoFm6DLsqp4fcUXiLlAPIyKQRVLFc1oeU4Po9QeuMwm
 sVsXiHI8RB32uWGnoz9tNMzTGZSEJbNjZwHJoQOzzrbgBqA4VEC3JLPKZp9UL96G8lpk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ySh4VBTwTZYqs5uHmfByRcOgkoy7vH0TFw3CRIHx+K8=; b=N
 PO1/7QaLwMGkgRVO6hcKJpamNu6fmKBPPbItRLexfKFshMmbCBp/S+Cm0wUViZ/lLWL8u7VauPyxH
 qYQg+WhY7yHl0DLN2yWHkWL9imOhYQJnvNJ7vO/7yfiRO+MprnOasPifIs6QOlHdczLxWNEs6v7WH
 lg273zOy0t43D8Pc=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ntKBm-003jJ8-Ub
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 May 2022 02:22:28 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220524022215epoutp042f8b22c1f544d9d8e1df68d838024ada~x6TElimm60824008240epoutp04j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 24 May 2022 02:22:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220524022215epoutp042f8b22c1f544d9d8e1df68d838024ada~x6TElimm60824008240epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1653358935;
 bh=ySh4VBTwTZYqs5uHmfByRcOgkoy7vH0TFw3CRIHx+K8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=U5imAkWdIDxLJ1BzwfFN6hr6sbvGAu0ZMELAVK9URUfz20i3nw81DDoAJyQ1qAiUg
 eDWSgcdrYaGizRoAeu+9NJcnweNFLn7pZzrK2oaiUYXhqBM04R719D50opaZoTdnux
 dJpba8RM0udU9IhgXyt+tLGC+pcUANEs8iLxR/bc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220524022215epcas1p17a6dc24bf7e9ffa4344ec3616c30bbde~x6TESDgVY1351013510epcas1p1B;
 Tue, 24 May 2022 02:22:15 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.247]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4L6dJ64fLTz4x9QF; Tue, 24 May
 2022 02:22:14 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BA.37.09785.6514C826; Tue, 24 May 2022 11:22:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220524022214epcas1p28d7b7de846e44cedf825eb4f5973932d~x6TDdoOCq2147121471epcas1p2B;
 Tue, 24 May 2022 02:22:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220524022214epsmtrp2956ccbc9e81f31696c8be62e11880dea~x6TDc1w7d0845208452epsmtrp2C;
 Tue, 24 May 2022 02:22:14 +0000 (GMT)
X-AuditID: b6c32a36-4ad09a8000002639-75-628c4156fcb3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7A.6A.11276.6514C826; Tue, 24 May 2022 11:22:14 +0900 (KST)
Received: from U20PB1-0435.tn.corp.samsungelectronics.net (unknown
 [10.91.133.14]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220524022214epsmtip1da14c599fd7db98f448d6b37c4626a7b~x6TDPhvJw2607926079epsmtip1K;
 Tue, 24 May 2022 02:22:14 +0000 (GMT)
From: Sungjong Seo <sj1557.seo@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org
Date: Tue, 24 May 2022 10:29:11 +0900
Message-Id: <20220524012911.725783-1-sj1557.seo@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOJsWRmVeSWpSXmKPExsWy7bCmgW6YY0+SwfxVihanp55lspjavpfR
 4sn6WcwWlxa5W1zeNYfNYsu/I6wObB4LNpV6bFrVyeaxe8FnJo++LasYPT5vkgtgjWpgtEks
 Ss7ILEtVSM1Lzk/JzEu3VQoNcdO1UFLIyC8usVWKNjQ00jM0MNczMjLSM7aMtTIyVVLIS8xN
 tVWq0IXqVVIoSi4Aqs2tLAYakJOqBxXXK07NS3HIyi8FOVqvODG3uDQvXS85P1dJoSwxpxRo
 hJJ+wjfGjLeT+9gLWrgq9k/dy97AOIGji5GDQ0LAROLXZuEuRi4OIYEdjBI7f7xkhHA+MUo0
 PPrABOF8Y5RYP+UScxcjJ1jHq//rWSASexklvm9Yxg6SEBJoZ5LY/CESxGYT0JZY3rQMrEFE
 QF3i1KSlLCA2s0ClxPqDb1hBbGEBf4mzzzaAxVkEVCWurJ4IZvMK2EjcuHMXapm8xMxL39kh
 4oISJ2c+gZojL9G8dTYzyBESAsfYJZZ8fscE0eAicefYQTYIW1ji1fEt7BC2lMTnd3uh4s2M
 Es2NRhB2B6PE042ykLCwl3h/yQLEZBbQlFi/Sx+iQlFi5++5jBC2oMTpa93MECfwSbz72sMK
 0ckr0dEmBFGiIvH9w04WmKVXflyFOsxD4sr9U9CQipU4f+oW6wRGhVlIHpuF5LFZCEcsYGRe
 xSiWWlCcm55abFhghBzDmxjBaVTLbAfjpLcf9A4xMnEwHmKU4GBWEuHdntiRJMSbklhZlVqU
 H19UmpNafIgxGRjUE5mlRJPzgYk8ryTe0MTYwMAImPDMLc2NiRC2NDAxMzKxMLY0NlMS5101
 7XSikEB6YklqdmpqQWoRzBYmDk6pBiYmhk+M/C83sLl33Yh7pLheQ23blF/Xeq4Z8Vp7SnH9
 7p3VG7OQca/UQeGN7zMWHbIK15utUCNw5/XNY+9CVL9MNUvnCvuc1bYyq1NhsuBTdRHLs0f1
 LnJOW3R2xmWNQI33HA2LggO23fP/HmX28UBzOfMZu0uMm/7FT7zw02WGqftt27drt/aIcvEe
 kVlovNBryqmqhOTHFye/9rv1R8Zpf+V0lZDzh1x+FzJKbcnw32z49L9/kJfCq0XGHceUL826
 oP0t6Cr7rM/MvAlyv1qnvlExujE1dd+7qRxNbgt4Z9ySTo9jDft86chjVzeHDR2ShrYZczdO
 P63pNPH0d8/okp82rquXPVq6uPinm6KsEktxRqKhFnNRcSIA+Tdu71oEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWy7bCSnG6YY0+Swc/dPBanp55lspjavpfR
 4sn6WcwWlxa5W1zeNYfNYsu/I6wObB4LNpV6bFrVyeaxe8FnJo++LasYPT5vkgtgjeKySUnN
 ySxLLdK3S+DKeDu5j72ghati/9S97A2MEzi6GDk5JARMJF79X8/SxcjFISSwm1Gi5eYPpi5G
 DqCElMTBfZoQprDE4cPFECWtTBJPZr1iA+llE9CWWN60jBnEFhHQlDjSOZMdxGYWqJVYveUn
 I0ivsICvxIoOGZAwi4CqxJXVE1lAbF4BG4kbd+4yQ5wgLzHz0nd2iLigxMmZT1ggxshLNG+d
 zTyBkW8WktQsJKkFjEyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCQ1JLcwfj9lUf
 9A4xMnEwHmKU4GBWEuHdntiRJMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU
 1ILUIpgsEwenVAPT1jQPbqY/S71PV8lsrtPljBRiLRYM9a+fqf+if+bDa/IxZrvsPb+v+F6u
 w9lUG5teOjG1TfvlrcZlAaFbWA1fFe/Zrh8WcdSI8cyfmXocZWYL3GzmJEqfiPd7HVG9zLKf
 ccaOP7vPX39/MuhXg6f9QrGpzauu6x7zmRxqcORctKadpkhFQbb2qn+/P3VqTkz57eoiFfpN
 ITXr367TN2UOzTD06ahm+n3+RrOAmvG/AtXAjSdvbnifOc14SRGTRn39izvvV+Z1aTR9PprQ
 /lX39dZ3JxRTsgPblu8ROZaiwHzHPpM7f9atnjOs/RGvtugzXa/KVC6c0aU1P1c7V74mNSbj
 mMirOOY3BiH/1yixFGckGmoxFxUnAgABde8yuAIAAA==
X-CMS-MailID: 20220524022214epcas1p28d7b7de846e44cedf825eb4f5973932d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
X-ArchiveUser: EV
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220524022214epcas1p28d7b7de846e44cedf825eb4f5973932d
References: <CGME20220524022214epcas1p28d7b7de846e44cedf825eb4f5973932d@epcas1p2.samsung.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since commit e3c548323d32 ("f2fs: let's allow compression
 for mmap files"), it has been allowed to compress mmap files. However, in
 compress_mode=user, it is not allowed yet. To keep the same concept [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntKBm-003jJ8-Ub
Subject: [f2fs-dev] [PATCH] f2fs: allow compression for mmap files in
 compress_mode=user
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
Cc: daehojeong@google.com, sj1557.seo@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since commit e3c548323d32 ("f2fs: let's allow compression for mmap files"),
it has been allowed to compress mmap files. However, in compress_mode=user,
it is not allowed yet. To keep the same concept in both compress_modes,
f2fs_ioc_(de)compress_file() should also allow it.

Let's remove checking mmap files in f2fs_ioc_(de)compress_file() so that
the compression for mmap files is also allowed in compress_mode=user.

Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
---
 fs/f2fs/file.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7aac53ac5acf..a05d842a7e72 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3945,11 +3945,6 @@ static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	if (f2fs_is_mmap_file(inode)) {
-		ret = -EBUSY;
-		goto out;
-	}
-
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret)
 		goto out;
@@ -4017,11 +4012,6 @@ static int f2fs_ioc_compress_file(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	if (f2fs_is_mmap_file(inode)) {
-		ret = -EBUSY;
-		goto out;
-	}
-
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret)
 		goto out;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

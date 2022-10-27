Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EEC60F607
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 13:17:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oo0sw-0007as-D2;
	Thu, 27 Oct 2022 11:17:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <keosung.park@samsung.com>) id 1oo0su-0007aa-G4
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 11:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zdBki9bdU0qOtfM6DVu6TjON7wD1YRTDGHk32ctigcw=; b=IoPCcRC23XgZ6R4tOyagFsHOOQ
 AQfMlkjmw4z80AfHEGCBz3SYu9BPoGS5wEH42R6TOfy5ALWHDaW1smCiVnHYh1f8uskWuOQKZoMhm
 BSNBuGHGqD+voJcnPpebSEsPpqI4Wu2x6Lewm3WQcApfMZdwpdeCCt/iyvl5GlPLbwiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zdBki9bdU0qOtfM6DVu6TjON7wD1YRTDGHk32ctigcw=; b=K
 JpZ0j2JZ8+u24kGju7yHoGMBsYf42AUixJ1DqeXX7ZHuzqYjZIdec3R8INglhZNpAvy/kT3ZRq5NY
 +3DKSvBMFwSKYEOJdFb3Okkf04eO1UtHba/8BTX/DfMGIB1CGD8TuqTLt1mP/+aW3KiiSlX+StfTj
 xIVtVbdB+CmGybH0=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oo0ss-0002gD-7J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 11:17:16 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20221027110107epoutp0128a77be57425b3b8f4ff7aef20604d5e~h6AobOAVz2288222882epoutp01f
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Oct 2022 11:01:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20221027110107epoutp0128a77be57425b3b8f4ff7aef20604d5e~h6AobOAVz2288222882epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1666868467;
 bh=zdBki9bdU0qOtfM6DVu6TjON7wD1YRTDGHk32ctigcw=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=simfjoGt5nwUBPg2vhne5+BViBGXev3+BmEL5c6VPoBp3qWZul1YFuj80u2J/0wKy
 4YIXK/hgujzFVsuS2z2nRCPV0yDaMOoqzjAi/HqQ5phVNf9i+ulZ0NKvfAxK8Bgms6
 dHBaS5ksloMAoimvr3u1PIU3fyFojVWQ/izK6TKY=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20221027110106epcas2p446203b379db421b1f43f1755d73abd8f~h6AoG8K021876418764epcas2p4V;
 Thu, 27 Oct 2022 11:01:06 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4MyjQp3ywTz4x9Pq; Thu, 27 Oct
 2022 11:01:06 +0000 (GMT)
X-AuditID: b6c32a48-e61b9a800001494a-7f-635a64f2cf89
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 C0.41.18762.2F46A536; Thu, 27 Oct 2022 20:01:06 +0900 (KST)
Mime-Version: 1.0
From: Keoseong Park <keosung.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20221027110105epcms2p10a8cc7e0e7c3b2960a8db4efaa574ae3@epcms2p1>
Date: Thu, 27 Oct 2022 20:01:05 +0900
X-CMS-MailID: 20221027110105epcms2p10a8cc7e0e7c3b2960a8db4efaa574ae3
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmme6nlKhkg73HpS1OTz3LZPHykKbF
 o9vPGC2erJ/FbHFpkbvF5V1z2BzYPDat6mTz2L3gM5NH35ZVjB6fN8kFsERl22SkJqakFimk
 5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYArVZSKEvMKQUKBSQWFyvp
 29kU5ZeWpCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGf82TuLreAha8X3
 C+tZGxifsHQxcnJICJhIrPu2jrWLkYtDSGAHo8SPk/eYuhg5OHgFBCX+7hAGqREWMJNYcmMV
 G4gtJKAk0bVwKzNE3EBi3fQ9YDabgJ7ElN93GEFsEYFXjBJnVotCzOeVmNH+FGqXtMT25VsZ
 IWwNiR/LepkhbFGJm6vfssPY74/Nh6oRkWi9dxaqRlDiwc/dUHFJidYzW9kg7HyJJzf7oebX
 SCzY/hkqri9xrWMjWJxXwFfi68XlYHNYBFQlvj7qYIKocZG4vWE3K4jNLCAvsf3tHGaQ15kF
 NCXW79IHMSUElCWO3GKB+aRh4292dDazAJ9Ex+G/cPEd855ATVeTeLRgCyuELSNxcc45qE88
 JHom/GKdwKg4CxHOs5DcMAvhhgWMzKsYxVILinPTU4uNCkzgUZucn7uJEZwGtTx2MM5++0Hv
 ECMTB+MhRgkOZiUR3rM3wpOFeFMSK6tSi/Lji0pzUosPMZoCfT+RWUo0OR+YiPNK4g1NLA1M
 zMwMzY1MDcyVxHm7ZmglCwmkJ5akZqemFqQWwfQxcXBKNTCl3Py3Nnch/83aa5wBnH28v//Y
 LXLVNtqWV7Au5PR6T6mdSl42J7/P3bT4x/R9lUqHjgn84mrkjJvGej5r/+aJb38aJYq+cslb
 pXL3umD5lzKp7OX3fq+9qBNm5y5avXfH+UVGgrGTH896duvpznmO9ozzt8VFO3zJS1i5a5X2
 G4+Kh3defJqpkv34MEduydOO08llHsUiX2OiqiUKT7qW8W08WPtlRtixmsUtM6+FbXifmbBc
 TnCbFnPJz7dlviyai8Kt3Qy2n3986rzthoOFFzUV7R4JS+btuMdy/WLHsxWKbMUbNFiPdaxg
 a7LgvP2ar//ccZGQWuXVwT8+SbmX3P+h47WN46LdfJ/sp1dVlViKMxINtZiLihMBPmKzpQwE
 AAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221027110105epcms2p10a8cc7e0e7c3b2960a8db4efaa574ae3
References: <CGME20221027110105epcms2p10a8cc7e0e7c3b2960a8db4efaa574ae3@epcms2p1>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Change "truncateion" to "truncation". Signed-off-by: Keoseong
 Park <keosung.park@samsung.com> --- fs/f2fs/file.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 8cd52b0965b1..aafdf5fbb825 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -571,7 +571,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_
 [...] Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oo0ss-0002gD-7J
Subject: [f2fs-dev]  [PATCH] f2fs: Fix typo in comments
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
Reply-To: keosung.park@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Change "truncateion" to "truncation".

Signed-off-by: Keoseong Park <keosung.park@samsung.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8cd52b0965b1..aafdf5fbb825 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -571,7 +571,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	raw_node = F2FS_NODE(dn->node_page);
 	addr = blkaddr_in_node(raw_node) + base + ofs;
 
-	/* Assumption: truncateion starts with cluster */
+	/* Assumption: truncation starts with cluster */
 	for (; count > 0; count--, addr++, dn->ofs_in_node++, cluster_index++) {
 		block_t blkaddr = le32_to_cpu(*addr);
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E40D3B0D8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 17:29:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyTkX0H9QYMVTCHnqbnOu1XP/2uEeDFpIWB4qt+yz5k=; b=U8UwV+Vvo8K+cd/8fwSXqpS7yW
	jb8u918lBWhASeppQ8IvgoUHsAqRNut8u2iMJ4b9DQaCeBg67x0OhtR2iEesy2sN804JIJoFx3MD+
	SQjoWP/wfcuSb714jImNkmiDzCpKpcCzvoesvzREWQ9tU9FXqfHhxMm/F6OYfsJPoFY0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhs7o-0005QT-RM;
	Mon, 19 Jan 2026 16:29:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vhs7m-0005Pw-8n;
 Mon, 19 Jan 2026 16:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7KH9GAMr/eWsf2mOE7iYyuOGJooyfONtnMuRkvbB1nI=; b=Ynb4pJDNinK1Qt5mPQlCJJPZvu
 RfuyhjP1z8cB80WZ0oFloVYzy9dTFlzMZ/gFqkSJlh6HMwz60ZZ/mLAO510Bc85YZOx0lCOkHCPIV
 TLhywxx4GjrW9PfXwFWc70gRx0JhHVRTbD9k1N3U3eOnXP96OUahLDoP2F8oFPY3FzW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7KH9GAMr/eWsf2mOE7iYyuOGJooyfONtnMuRkvbB1nI=; b=UH6n3qVzSbLy96faVn9jemU89j
 LitI6fKKhTpXhXi1OFCKTW021DC/PNlvO0GA5+ftGUeTX6b72w0Hbbs7wlatWTCrMUsCFwoNRL85c
 Nn1fgDGKOPDPlBtiM2+VxvuV+YwNFRoPIqZkVxsK5kZXy0JZQUXSFefeGkX4NFnRhKXM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhs7j-0007sY-Fb; Mon, 19 Jan 2026 16:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 215E543453;
 Mon, 19 Jan 2026 16:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27114C116C6;
 Mon, 19 Jan 2026 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768840133;
 bh=DOe7Zr+SC0SYYE7gHRN3EzdcslwerK27BkcLvt/YLFc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gLSidMGqIduwhhiZBRl97kiG2r0WSem//2Bu5eDamZwGlTsr9LrpoWaTD9OIQfiWG
 PIcjpOsrKsKKoBTdH0RVx2h9oNObYSeGccUXe0tJOExLbMz6brRFhHfwX/xW4p00iT
 0Aapwu+EBjx7X/ebQKY2u7Oc8Xm18MDBtNma1ZzvpgTWbbE40PXPlZWrfrPbUzljXx
 ti2hbcDLHS2Mtd0BBszkVSvql1u5IKlKWMkfPiUeXlny3aVa3EZJYwuW6qOP2hLnJa
 Sg5Vh/88liPis+95Wn+gdIj3gOvrNfxxM7In62NU0dbDOMh6+HROaUGGYnEd+tPfR/
 KjdC6A4vI7Quw==
Date: Mon, 19 Jan 2026 11:26:30 -0500
MIME-Version: 1.0
Message-Id: <20260119-exportfs-nfsd-v2-13-d93368f903bd@kernel.org>
References: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
In-Reply-To: <20260119-exportfs-nfsd-v2-0-d93368f903bd@kernel.org>
To: Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Amir Goldstein <amir73il@gmail.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
 Chunhai Guo <guochunhai@vivo.com>, Carlos Maiolino <cem@kernel.org>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, 
 David Sterba <dsterba@suse.com>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
 Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, 
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Dave Kleikamp <shaggy@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
 Andreas Gruenbacher <agruenba@redhat.com>, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=DOe7Zr+SC0SYYE7gHRN3EzdcslwerK27BkcLvt/YLFc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpbltcB67I3Cfm08JpbcXHGEkrLfaJbcvd3qnwq
 BhDRd4AN+OJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaW5bXAAKCRAADmhBGVaC
 FbS8D/432THFEGWROgX8dP/qCEuSNPHNLeycBv+YXQdISlJtiHD4iuhGoQ+OgERyuJmu3TcYkEQ
 P0eYFomKXV8jqpqGO2/2SDRE8CSame7BrqEo+F6vqJ6h4aVkE6ufeuJybyvumep1nUmlsIk2DsU
 u0fENt3ExKeLea7brus3iT8xHM0CItU8XQS5RVMuiU/SxqPPEs6Gb5NrQ0Nb/yKLHlN0JpOjBD1
 u5kv+v0F3ZlB9nG8fp17BTBsCD/QSUkuv/VXguesgG1a1OdU1QlUIJf1bvZTI1eDySl/V1zJ/ys
 pB7kAyYPYpDzTxPmSOSrYVzGbRdfgIfCzChXnUTHchfvlYDkLqmoNjSVx4VcTmBHGy0wZq+p3Ij
 gw4LUOedWkbXdEWCD1VLGQ2lmsKA6KzmNxKG2DguLX57oTKI9hKSx1QkPTgioRhhpjAffxxzZzK
 YG/0f5pV4d15jKegKxjp7WbBOW2h9cYTfkca9b3NtC/IUE/cP6DzojeN7GJRXhtM/23HU+stsUF
 PYmwauk2mN1n1kuL/EXO+pG81cd36tlZ+q+6noHC81NKX6rfqcujUI2rrAH+gabLD5BcxHCkrQM
 nn8xl4i9spqRbsniTmZPDusVh+1BEp/XL0fHi6MMd2JHyHZaS6gOgg4V3V4ygHuuECMOaIqJVcC
 YlFVQwsgmBIRBJg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the EXPORT_OP_STABLE_HANDLES flag to udf export
 operations
 to indicate that this filesystem can be exported via NFS. Reviewed-by: Jan
 Kara <jack@suse.cz> Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 fs/udf/namei.c | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhs7j-0007sY-Fb
Subject: [f2fs-dev] [PATCH v2 13/31] udf: add EXPORT_OP_STABLE_HANDLES flag
 to export operations
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-unionfs@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, David Laight <david.laight.linux@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add the EXPORT_OP_STABLE_HANDLES flag to udf export operations to indicate
that this filesystem can be exported via NFS.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/udf/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index 5f2e9a892bffa9579143cedf71d80efa7ad6e9fb..7b8db8331c77bb43d9a3c4528aee535eac2bbd37 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -1012,6 +1012,7 @@ const struct export_operations udf_export_ops = {
 	.fh_to_dentry   = udf_fh_to_dentry,
 	.fh_to_parent   = udf_fh_to_parent,
 	.get_parent     = udf_get_parent,
+	.flags		= EXPORT_OP_STABLE_HANDLES,
 };
 
 const struct inode_operations udf_dir_inode_operations = {

-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

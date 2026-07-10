Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cDHPFFNmUWoQEAMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:38:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B1D73F098
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 23:38:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=LswfaRK+;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=EGogUuKZ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=h3ZlTPI4;
	dkim=fail ("body hash did not verify") header.d=meta.com header.s=s2048-2025-q2 header.b=bjlBOBXa;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzkXeeBNzHXFA2TX9bEswPZJs/rG2DVqVHTDtjIucmQ=; b=LswfaRK+WRBcwVZIVFRYjsVBIl
	wPQC578HkmdJH3zy3wdnV4m00favYwz+7bn99wb1IbGO2EBeuNouRY9XptJ0hgfHOnQaZJuqLsfNR
	NGybDzPw7bfRq6xfYvZwyd8LPltKfMHzTOdHyvYMaX6lTvmL5ygqeM1Ebe1jcun7CxDE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiIvP-0004u8-L1;
	Fri, 10 Jul 2026 21:38:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=5651d212ed=kbusch@meta.com>) id 1wiIvO-0004u2-Fq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xbr3xRrdEjq5YpoLpex95WcD7awZQdQFrPVkkLo6Th0=; b=EGogUuKZIMw93ZN9qCJX+Ssu8H
 3zokkop4y3jqdAbqDbBCZ8E8Ljh9VD/Unnres3xNtWLm2niBN6Xt0DjWCkcK9H2hT2rYBl/xsGo8A
 UJotnBHuzuVZazKCDBmFT97B218y45HcB/Qa4VYc9/qr/K18e8lXOFkwDGZTey7GQNO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xbr3xRrdEjq5YpoLpex95WcD7awZQdQFrPVkkLo6Th0=; b=h3ZlTPI4la/TZbuD3WsvThSudz
 cz5KAxa7XDYBewUXdckWRKvFn1ClGvAqD6HdhkL7Mn7Tz7NPR/JIfNuuBOKK4Eq3t0yb5y+D1Px3F
 V2/ca0kCyVusuYGSrXPds/DcxZve7ZL3gWpwmA7rms4EFoTR0Y4SwO4ZA/RBAYikE/ok=;
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiIvO-0007sT-FE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 21:38:23 +0000
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK48Cp2308652
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 10 Jul 2026 14:28:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=xbr3xRrdEjq5YpoLpex95WcD7awZQdQFrPVkkLo6Th0=; b=bjlBOBXaxPmZ
 taMTueFN/916+1wq+fhjXOM7KAsyPxo2qAlaQG9HBsDCq4qbJACRHn/PD9RQtdsM
 wpj7PdKHQBvhWOVroeblT8MbKHLej5qc2OiI//a6pwYU55F5OK53qXoaMYv4fuz5
 SjRwXALhB4ta8Atiz7nVtCD5bHDxNsUgq0XQeiUF+LmziSSjOcaxku8rVIsxcMrf
 8HjMcjQsNNqiRuX9EseS8iEqmUtA7LZSEm5I/imHbDNvAm+z/iXi06cNAFtGENb5
 e60lsKLhW91vc2BCX/VF84iyjUIfm2LpDQbiUknZ1T1s/KlWX6WsZShrW/lkkZpP
 qJdubp5w5Q==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fa9djk6cv-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Jul 2026 14:28:12 -0700 (PDT)
Received: from twshared21331.34.frc3.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 10 Jul 2026 21:28:09 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
 id 4F6D924F006F5; Fri, 10 Jul 2026 14:06:47 -0700 (PDT)
To: <linux-block@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-fsdevel@vger.kernel.org>, <linux-xfs@vger.kernel.org>
Date: Fri, 10 Jul 2026 14:06:42 -0700
Message-ID: <20260710210646.3576365-2-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260710210646.3576365-1-kbusch@meta.com>
References: <20260710210646.3576365-1-kbusch@meta.com>
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxNSBTYWx0ZWRfXy/BLJIRnsa93
 5H3xRGE/sdSMOEznjgYaS904pOBgeVyg4H4fu07MlVKNXqluLb7LfkOvnfIRxhDUntkttX2gYp3
 BXORSy/P4cscKXONO6jA/w2gD5uGz+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxNSBTYWx0ZWRfX8HedhNF8Q/Af
 7gkwNwmg1Bh1Z1KfcK/NHA29S2XJ2UejMbfxAfHe4DPopFcjzPuTTR9FlwCK9qIz3uB42x84H4O
 ZWCrCU1gkTqAXnyV2ZDLgv6lbRdyp1NUe6vmsiO4OwSbHk6DZROhhSLHVFauoP6yB1FZVEnw49F
 KKG22Zrmcdqq/8+aWNn3x0qOPrWu9CwW9W32TCCanTqgSaZitJc/33/WV5YN7D0BT1pXBhOIGeE
 8EZkn8ckn+53AAxwhNLVDhSP0K662QVb5O5QqBVPIuMFKMk93/wq6F9t1RrFjcetcWcegfGHscz
 1ikyqA0VRc8tt8xOoYL9/wdLS260avIRih8j5KHHJgU59pjep8wXqD+NjmnR4vLpCdOxJ7WZykv
 oeJA04twFS6M6CmVu3oXgyxFI1SSUHsnt+83M0Qvff0skgGzMhezky1XXT7uvZyjuwU6xeUhhCw
 rOa3l7hQuXqlViNTUWg==
X-Authority-Analysis: v=2.4 cv=ToHWQjXh c=1 sm=1 tr=0 ts=6a5163ec cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=jCddH8ec0KUNCymVuxII:22 a=VwQbUJbxAAAA:8 a=q1EBQPuWEeZjY2uRj4sA:9
X-Proofpoint-ORIG-GUID: ymSoiOi9vCcuIeNRfkl1EUTlc5IKTulX
X-Proofpoint-GUID: ymSoiOi9vCcuIeNRfkl1EUTlc5IKTulX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Keith Busch <kbusch@kernel.org> Direct I/O imposes
 alignment
 and layout constraints that come from both the filesystem and its backing
 storage. statx() reports some of these, but not all, and it can no longer
 be extended. Report the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [67.231.153.30 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [67.231.153.30 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wiIvO-0007sT-FE
Subject: [f2fs-dev] [PATCHv2 1/5] fs: add direct io attributes to
 file_getattr
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
From: Keith Busch via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Keith Busch <kbusch@meta.com>
Cc: axboe@kernel.dk, brauner@kernel.org, aalbersh@kernel.org, jack@suse.cz,
 tytso@mit.edu, Keith Busch <kbusch@kernel.org>, jaegeuk@kernel.org,
 cem@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-block@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:aalbersh@kernel.org,m:jack@suse.cz,m:tytso@mit.edu,m:kbusch@kernel.org,m:jaegeuk@kernel.org,m:cem@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,meta.com:s=s2048-2025-q2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,meta.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:replyto,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[kbusch@meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3B1D73F098

From: Keith Busch <kbusch@kernel.org>

Direct I/O imposes alignment and layout constraints that come from both
the filesystem and its backing storage. statx() reports some of these,
but not all, and it can no longer be extended. Report the complete set
through file_getattr() in new struct file_attr fields so applications
can know the constraints they have to work with.

The fields are valid only when FS_XFLAG_DIO is set in fa_xflags. When it
is clear the file does not report direct I/O geometry, for example,
because the filesystem configuration does not allow direct I/O, does not
support file_getatter, or is using the legacy block sized alignment
constraints.

The new fields are defined as follows:

  - fa_dio_mem_align: byte alignment required for each I/O memory
    buffer. The starting address and length of each buffer vector must
    be a multiple of this value.

  - fa_dio_offset_align: alignment required for the file offset and
    total length of a write.

  - fa_dio_read_offset_align: the same, but for reads. It may be
    smaller than the write alignment allowing reads at a finer
    granularity, but will be at most the same as writes.

  - fa_dio_virt_boundary_align: alignment required at the boundary
    between adjacent memory segments of a multi-segment transfer. The
    previous segment must end on that boundary and the next must start
    on it; otherwise, the kernel will split the command at that vector
    if possible, or return an error if not (the accumulated length
    is shorter than "offset_align"). A value of 1 means there is no such
    constraint.

  - fa_dio_offset_align_max_vecs: the maximum number of io vectors that
    may compose a single fa_dio_offset_align unit. Buffers too small to
    reach that unit within this many vectors can not form a valid I/O
    and will be rejected by the kernel.

The fields are read only; file_setattr() ignores them.

The fa_pad field is introduced as a reserved field to account for an
implicit padding on 64-bit architectures and to make the struct the same
size for 32-bit. It must be zero to keep the space available for future
use.

Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 fs/file_attr.c           |  7 +++++++
 include/linux/fileattr.h | 10 ++++++++--
 include/uapi/linux/fs.h  | 10 +++++++++-
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index bfb00d256dd56..b37a55f54a449 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -110,6 +110,11 @@ static void fileattr_to_file_attr(const struct file_kattr *fa,
 	fattr->fa_nextents = fa->fsx_nextents;
 	fattr->fa_projid = fa->fsx_projid;
 	fattr->fa_cowextsize = fa->fsx_cowextsize;
+	fattr->fa_dio_mem_align = fa->fsx_dio_mem_align;
+	fattr->fa_dio_offset_align = fa->fsx_dio_offset_align;
+	fattr->fa_dio_read_offset_align = fa->fsx_dio_read_offset_align;
+	fattr->fa_dio_virt_boundary_align = fa->fsx_dio_virt_boundary_align;
+	fattr->fa_dio_offset_align_max_vecs = fa->fsx_dio_offset_align_max_vecs;
 }
 
 /**
@@ -145,6 +150,8 @@ static int file_attr_to_fileattr(const struct file_attr *fattr,
 
 	if (fattr->fa_xflags & ~mask)
 		return -EINVAL;
+	if (fattr->fa_pad)
+		return -EINVAL;
 
 	fileattr_fill_xflags(fa, fattr->fa_xflags & ~FS_XFLAG_RDONLY_MASK);
 	fa->fsx_extsize = fattr->fa_extsize;
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 58044b5980162..3d5384c79398e 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -17,11 +17,11 @@
 /* Read-only inode flags */
 #define FS_XFLAG_RDONLY_MASK \
 	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | FS_XFLAG_VERITY | \
-	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING)
+	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING | FS_XFLAG_DIO)
 
 /* Flags to indicate valid value of fsx_ fields */
 #define FS_XFLAG_VALUES_MASK \
-	(FS_XFLAG_EXTSIZE | FS_XFLAG_COWEXTSIZE)
+	(FS_XFLAG_EXTSIZE | FS_XFLAG_COWEXTSIZE | FS_XFLAG_DIO)
 
 /* Flags for directories */
 #define FS_XFLAG_DIRONLY_MASK \
@@ -49,6 +49,12 @@ struct file_kattr {
 	u32	fsx_nextents;	/* nextents field value (get)	*/
 	u32	fsx_projid;	/* project identifier (get/set) */
 	u32	fsx_cowextsize;	/* CoW extsize field value (get/set)*/
+	/* struct file_attr dio alignment: */
+	u32	fsx_dio_mem_align;
+	u32	fsx_dio_offset_align;
+	u32	fsx_dio_read_offset_align;
+	u32	fsx_dio_virt_boundary_align;
+	u32	fsx_dio_offset_align_max_vecs;
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index bd87262f2e349..a49572fab3726 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -229,10 +229,17 @@ struct file_attr {
 	__u32 fa_nextents;	/* nextents field value (get)   */
 	__u32 fa_projid;	/* project identifier (get/set) */
 	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
+	__u32 fa_dio_mem_align;	/* DIO memory buffer align (get) */
+	__u32 fa_dio_offset_align;	/* DIO file offset align (get) */
+	__u32 fa_dio_read_offset_align;	/* DIO read offset align (get) */
+	__u32 fa_dio_virt_boundary_align;	/* DIO virt boundary (get) */
+	__u32 fa_dio_offset_align_max_vecs;	/* DIO vecs per unit (get) */
+	__u32 fa_pad;		/* alignment padding, reserved for future use */
 };
 
 #define FILE_ATTR_SIZE_VER0 24
-#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
+#define FILE_ATTR_SIZE_VER1 48
+#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
 
 /*
  * Flags for the fsx_xflags field
@@ -261,6 +268,7 @@ struct file_attr {
  */
 #define FS_XFLAG_CASEFOLD	0x00040000	/* case-insensitive lookups */
 #define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
+#define FS_XFLAG_DIO		0x00100000	/* DIO alignment info valid */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
-- 
2.53.0-Meta



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

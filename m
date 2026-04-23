Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO8vMeka6mkOuQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC945294B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4t46nybBjH7QgKjGxRJbmTdmyEZHPeJSfcPwzC4M5w=; b=RuKcIXDP6SFwljA9C1AMRTQ9uX
	sKGnUAYGua9INVxit/KwMXfkIk1ofnYPuII9ElYOmztCw0HpRDjoBRwe7mpzqeL2RZdwQichDtk1J
	MRCUV8YfScph8mQHV3v11XU5yUsSkqVc05q4WL5qQdEBzpuEoG9oLFdUjiF5sdJT6Lmk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFtrk-0002hE-2q;
	Thu, 23 Apr 2026 13:13:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFtrh-0002ga-Cq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dTil1hlndXSPrLU0JQ6dRnyEVrbf8jZ/guYQ4mRVpa0=; b=hDahYuFiYqnDelojkY/WsFX23o
 VWLNhoI+5rQtUySVZb7vPpfEwoAhYWS8WYnHNGrou8hX6OVKoduzBL9gqlnM5PzSu2RT5/0eg2n27
 rijx6Mg0T9OVQaN8M8nceLX9fg5+vdCCM87oQTQB2lGLqKvoGpa0lmOp4gVlTfPK1xLw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dTil1hlndXSPrLU0JQ6dRnyEVrbf8jZ/guYQ4mRVpa0=; b=G8iyBdRYUNVr0MnMDDMu5AzkVd
 DKe7QL0CWTCgL1I+SoDqNFaTJBO7F9ysrGBTZQ2lPMETJWnBEZwpfwXaaqq+OA1Yen0ZANSMBK1+d
 o7R7nm6w6vo3hc8MXs6+izvjjjHkeK3ifNVoIxzUHtprmrgwNUahEL8Y82GLpnvNmTB8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFtrf-0006qC-1h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE9ED41852;
 Thu, 23 Apr 2026 13:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48483C2BCB3;
 Thu, 23 Apr 2026 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776949981;
 bh=XYKt46mg6wMVV2YdJGZU1apyeQ0MXeEOOUK+OVQco70=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JaYE/SnQVrEr92eGos5xu+rxKnYB29JOGxvTWLOW1s8/0pkDpc/NDjL6YenlsD1UX
 eHtXvOkGvvUY70x9iSx5tdDAD46V14R1J3yE6Cl67tvoW7BkGGfsP3gX1aHI6j8u8F
 2wCG3dL6AJd9cNlnrojPiq+yf0RiFQqXeENNOZRZVqchN0PgAagYrcrDs+Kli5SN70
 FOGzI0MZoHx9utRo0PcvcCOwYvLnkXClk5EfZ00GJ/AbDnQfP9YUdIJgBOvI7w8BqR
 IzJ06vmiyD90lWmlKydA/mr2NNtbgZd4Guj+j9XGwHh3GzzLGmatVAnLpG/t8FCBG5
 WVJsMO7xH30mQ==
Date: Thu, 23 Apr 2026 09:12:19 -0400
MIME-Version: 1.0
Message-Id: <20260423-case-sensitivity-v10-16-c385d674a6cf@oracle.com>
References: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
In-Reply-To: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2833;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=QFOGuYFmcxqWyXGZEGt68U1bhDPXmPPrCdAEtt84t6g=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp6hq0SERDMzl/Ku6k/coKNHnWTaSTkehoUKGr1
 XmcqZPciViJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaeoatAAKCRAzarMzb2Z/
 l+ycD/0XgnwZjb+9LZ1rFtZ/uYLu7XNGKoWGsTX0pGthYq7Ri4V7/KNMz7dap+QXhykptCfRODB
 VXFszVhCfmFBjn32+ec5ZMA65+iem2nVL18lFNplLt84eYxQlVQ4kUioFiyDG8JZslt5cNfV7r5
 o/8ILCI9Ea7ga6nEEXUUiXkugmzKgDPiK56FVzu8gLZA53SIBoiILFyQMskPQ2LmTTGFDwtoQun
 J/qM4Q4WErc5UybzBqcVlWxD8lYBlpMqmFiSpaHFFWk30HYuANc2srzAY049/esIHMLWRlZDXJe
 wHswH9Qo0VyHxY1jtAw2o6Lt+gPrX9DaSE5xac6hlhc+0e10IvKCsymoUKbK808tRIRDiIPtfgU
 VL3Vv5rpzV821SHU5m8iF8PwxYyg3OVvCSfaZ7ntMLtLz+I2AArRCXRUPeutyc2OWuYFZG/KUdv
 SjpeeLJ/IBjZjwyMKdGYxdGlVUaXoXjcmCxB/4dD30XTIVpP1nM0V3jHKhL1usNCeJE3Y00RvLb
 IzoPwqVA4F0ETMqlhXoC+FcuVuG1jFzQiL1fa/9U3GqfuDXA6E2haY4V3H3kf4anCk+xZ896xZ4
 TmS6hzQD9y91jQbH19KpUVc+UXRiSK8OwnDtePopyx6OsNf8SwMTYN5qbCQvD0KbYOqEt10yfjI
 b/LfLZXA5r/lbRA==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chuck Lever <chuck.lever@oracle.com> NFSD currently
 provides NFSv4 clients with hard-coded responses indicating all exported
 filesystems
 are case-sensitive and case-preserving. This is incorrect for case-insensitive
 filesystems and ext4 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFtrf-0006qC-1h
Subject: [f2fs-dev] [PATCH v10 16/17] nfsd: Implement NFSv4
 FATTR4_CASE_INSENSITIVE and FATTR4_CASE_PRESERVING
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de,
 jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-6.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MAILSPIKE_FAIL(0.00)[216.105.38.7:server fail];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 65FC945294B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chuck Lever <chuck.lever@oracle.com>

NFSD currently provides NFSv4 clients with hard-coded responses
indicating all exported filesystems are case-sensitive and
case-preserving. This is incorrect for case-insensitive filesystems
and ext4 directories with casefold enabled.

Query the underlying filesystem's actual case sensitivity via
nfsd_get_case_info() and return accurate values to clients. This
supports per-directory settings for filesystems that allow mixing
case-sensitive and case-insensitive directories within an export.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/nfsd/nfs4xdr.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 2a0946c630e1..961cd59756fb 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -3158,6 +3158,8 @@ struct nfsd4_fattr_args {
 	u32			rdattr_err;
 	bool			contextsupport;
 	bool			ignore_crossmnt;
+	bool			case_insensitive;
+	bool			case_preserving;
 };
 
 typedef __be32(*nfsd4_enc_attr)(struct xdr_stream *xdr,
@@ -3356,6 +3358,18 @@ static __be32 nfsd4_encode_fattr4_acl(struct xdr_stream *xdr,
 	return nfs_ok;
 }
 
+static __be32 nfsd4_encode_fattr4_case_insensitive(struct xdr_stream *xdr,
+					const struct nfsd4_fattr_args *args)
+{
+	return nfsd4_encode_bool(xdr, args->case_insensitive);
+}
+
+static __be32 nfsd4_encode_fattr4_case_preserving(struct xdr_stream *xdr,
+					const struct nfsd4_fattr_args *args)
+{
+	return nfsd4_encode_bool(xdr, args->case_preserving);
+}
+
 static __be32 nfsd4_encode_fattr4_filehandle(struct xdr_stream *xdr,
 					     const struct nfsd4_fattr_args *args)
 {
@@ -3748,8 +3762,8 @@ static const nfsd4_enc_attr nfsd4_enc_fattr4_encode_ops[] = {
 	[FATTR4_ACLSUPPORT]		= nfsd4_encode_fattr4_aclsupport,
 	[FATTR4_ARCHIVE]		= nfsd4_encode_fattr4__noop,
 	[FATTR4_CANSETTIME]		= nfsd4_encode_fattr4__true,
-	[FATTR4_CASE_INSENSITIVE]	= nfsd4_encode_fattr4__false,
-	[FATTR4_CASE_PRESERVING]	= nfsd4_encode_fattr4__true,
+	[FATTR4_CASE_INSENSITIVE]	= nfsd4_encode_fattr4_case_insensitive,
+	[FATTR4_CASE_PRESERVING]	= nfsd4_encode_fattr4_case_preserving,
 	[FATTR4_CHOWN_RESTRICTED]	= nfsd4_encode_fattr4__true,
 	[FATTR4_FILEHANDLE]		= nfsd4_encode_fattr4_filehandle,
 	[FATTR4_FILEID]			= nfsd4_encode_fattr4_fileid,
@@ -3968,6 +3982,13 @@ nfsd4_encode_fattr4(struct svc_rqst *rqstp, struct xdr_stream *xdr,
 		args.fhp = tempfh;
 	} else
 		args.fhp = fhp;
+	if (attrmask[0] & (FATTR4_WORD0_CASE_INSENSITIVE |
+			   FATTR4_WORD0_CASE_PRESERVING)) {
+		status = nfsd_get_case_info(dentry, &args.case_insensitive,
+					    &args.case_preserving);
+		if (status != nfs_ok)
+			goto out;
+	}
 
 	if (attrmask[0] & FATTR4_WORD0_ACL) {
 		err = nfsd4_get_nfs4_acl(rqstp, dentry, &args.acl);

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

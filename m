Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2fybOZOAAWqebgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 09:09:07 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23816508E34
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2026 09:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=41w0CEb8asSwZYDNXtNhyHqBPMkP0cmlhx+3JilIfXw=; b=lRqm0ZbWOllAtskqOKRaPn7tWX
	T7yek0wUDpbRolFr3AwcGFAQbvKLb/XWbNbMKbIOva8ll9NazrkXr0qEQWxfO+XT+XXupCCqAUqLG
	fU9IGWRTm8TPfvpAMAVjGr+A7cG8ToTEBE2HOzdWenBUu7Ii9NBERNo/Xm1jO++noifY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMKlB-0006xw-5W;
	Mon, 11 May 2026 07:09:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rollkingzzc@gmail.com>) id 1wMKl9-0006xe-39
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 07:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qfUUSCmFNiOS4cO4PS6qgNqN/14FKh66epqOIEkfHQ8=; b=ZFZK5tkgs2O1F5F6IpQlnpiAmn
 HosJxc/lBB5ddhxH6PeoxXm4vnCRA31MBShV4YMngdJbkybQpR32oDLvcWLNQrMiU4tgTZ9epQQF/
 4tO8zR1iG3dwEuN2GT19zrjDOiPN2Ixg3Q5n0nFBrJlirs/T7/Mp5Ka/3QS/N/F55y+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qfUUSCmFNiOS4cO4PS6qgNqN/14FKh66epqOIEkfHQ8=; b=d
 AARJ5J2l0aR53IJbBnS1LZw5GEYKZWzhCP4AKomksIkAirwwmkM11GsR+G/yaur1Jn5cllXrHyUQm
 tXUxjtDPWQD30P/xSIVHlZWLCEx99DcS02HIhlTS7tsGagVHmyxd3ChIPDmHKFuWAZUHX8lMOiSgS
 VhZO6I5yYmGANb7s=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wMKl9-0005Fi-Ag for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 May 2026 07:08:59 +0000
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-366375c43c2so2069104a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 May 2026 00:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778483333; x=1779088133; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qfUUSCmFNiOS4cO4PS6qgNqN/14FKh66epqOIEkfHQ8=;
 b=EkqtwmdG0ZJ54Xr9NREVlSRYiYdQO2QVywmODrrDNTYCAW52s0hGRY1zyWV2y7mbpG
 ii36UalFSUV//PTL+wSj0rfzipx0sc3SeUQtf7hXL3fyCYFv6Mw5rTlnlU/auU6ciCtZ
 ThgjhAcnOMiqWMX69r9/qL229X9pnOSQyDRMEssSIhZ+mO1QtkYg8oTVwtuLEdOiTfRf
 SINVv0eBRHlWoGr8Y/QCZACOBE3/DMsEzzMF34PsWUOcLiGAwe1Qm7Js1W5r3uITfttD
 8qGjLxHFHMorAWxcqXbmqs4zRxzgrX1XGgMULbspOq/or7o23c6nN0H0dh6wXpM/LPat
 csBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778483334; x=1779088134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfUUSCmFNiOS4cO4PS6qgNqN/14FKh66epqOIEkfHQ8=;
 b=d1h2Ti8ZCW22/xfN1y0Q0ZxSBoZnXWf5bNSWvfs+uWyinEXhoUAbTYyy5v9SPscMWx
 dJHDAcePPS760r0Rkq9psX0zHmtToZ7RFA6STQeysKiKXx8ywHW10xy12hpbgLtid0Rh
 IBJS5AuiwWHPJsW5aWXbAFj/m5JkLGJAUB8Tkq7UQUYJS74VTW2OZGY5NRwY3pUDrK/x
 yLohaNwFlWu3JOi6DYBh328CduLvhDpidN/oU1nU43QL/XoDY6O048RuwRiI6QHhkPPD
 FlQzqMMe75z8QLxSacQUxBacX9Wl6cKELcDvbnWDupIwhKtWgdDL7ipU4I1tqVx4PPsO
 4XVA==
X-Gm-Message-State: AOJu0Yxzo1uePWUG2137AB8GpJZXrZEREmHMQOkYNv4tVM3sSndDa6fz
 i8RuGCyRrix7O9Eb3+q6MOn/Cht75mrLIG/lVfeGpPjR08yhfL9VIEHN
X-Gm-Gg: Acq92OEuT+vfSmj/EA7TZPBbCjd0U5J2u3hknpR07FTYJZZu6qLvvAWVLboPknmKcuU
 LqSd5fONOaT/+WZr8yRoyV7AGJnyXMlqQY0Fb32+fmQwT9qB0++FnPEKg343R8W9Hf+to6lpQ2w
 uZlrtuSsOS1wvkCB1mYvVY4SWcG0GghkbOVGYQkMjNmdEiGVwButLsAEDqsIMGnsVkvMtsMiOOb
 nNa6zVpK8Fe0ckkQK6u6ZhawP7fzDxrqYtEdUC7rjRRTq0KkD/0DdLHfT9Ep0bLYdNz25xVR4N6
 5odNH/WeaVReRw870971NZ+1IJfI1vRyKnsovFkjnla1ZvGppqovuEpXcN0bFjRTHkfmzhrqOWQ
 bUXAabhfVoChm4b3JkNaWG/B63YfvlzUnOX+a7ahUjkk1Jvm5w9+67w16nRkLvBrvmaQDIiLgnn
 05W7E0AfMdOGqMsrhbX2JOTo6qrDO3+lya1IgNeMEtQw==
X-Received: by 2002:a17:902:f30e:b0:2b0:b41e:c5c3 with SMTP id
 d9443c01a7336-2baf0e04babmr99821945ad.29.1778483333377; 
 Mon, 11 May 2026 00:08:53 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1e78c6csm95818865ad.60.2026.05.11.00.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 00:08:52 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 11 May 2026 15:08:43 +0800
Message-Id: <20260511070843.2112692-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_acl_from_disk() parses disk-provided POSIX ACL xattrs
 by first computing an entry count from the total xattr size and then walking
 the records according to each entry tag. The walk must prove tha [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rollkingzzc(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wMKl9-0005Fi-Ag
Subject: [f2fs-dev] [PATCH] f2fs: validate ACL entry sizes before parsing
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
Cc: 2045gemini@gmail.com, zerocling0077@gmail.com, linux-kernel@vger.kernel.org,
 Zhang Cen <rollkingzzc@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 23816508E34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:2045gemini@gmail.com,m:zerocling0077@gmail.com,m:linux-kernel@vger.kernel.org,m:rollkingzzc@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

f2fs_acl_from_disk() parses disk-provided POSIX ACL xattrs by first
computing an entry count from the total xattr size and then walking the
records according to each entry tag.  The walk must prove that the next
short entry header is present before reading e_tag and e_perm, and that a
full entry is present before reading e_id for ACL_USER or ACL_GROUP.

The current code only rejects entry pointers that are strictly past the
end of the xattr buffer.  A malformed ACL can make the tag-driven walk
land exactly at the end while the size-derived count still has entries
left.  The next iteration then reads e_tag/e_perm one entry past the
supplied ACL value.  Sanitized testing on the affected tree reported
slab-out-of-bounds reads in __f2fs_get_acl() from ACL retrieval paths,
with the read address immediately past a 20-byte ACL buffer.

Reject malformed ACLs before each dereference by checking that the short
entry header fits at the start of every iteration, and checking that a
full entry fits before consuming e_id for ACL_USER and ACL_GROUP.  This
keeps valid ACLs unchanged while returning -EINVAL for truncated or
width-inconsistent ACL xattr values.

Sanitizer validation reported:
KASAN slab-out-of-bounds in __f2fs_get_acl()
Read of size 2
Call trace:
  dump_stack_lvl() (?:?)
  print_address_description() (mm/kasan/report.c:373)
  __f2fs_get_acl() (fs/f2fs/acl.c:169)
  print_report() (?:?)
  __virt_addr_valid() (?:?)
  srso_alias_return_thunk() (arch/x86/include/asm/nospec-branch.h:375)
  kasan_addr_to_slab() (mm/kasan/common.c:45)
  kasan_report() (?:?)
  f2fs_get_acl() (fs/f2fs/acl.c:200)
  __get_acl() (fs/posix_acl.c:114)
  vfs_get_acl() (?:?)
  do_get_acl() (?:?)
  __kvmalloc_node_noprof() (?:?)
  do_getxattr() (?:?)
  filename_getxattr() (?:?)
  strncpy_from_user() (?:?)
  path_getxattrat() (fs/xattr.c:838)
  rcu_is_watching() (?:?)
  do_syscall_64() (arch/x86/entry/syscall_64.c:87)
  entry_SYSCALL_64_after_hwframe() (?:?)

Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

---
diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index fa8d81a30fb9..290fee451637 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -70,7 +70,7 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 
 	for (i = 0; i < count; i++) {
 
-		if ((char *)entry > end)
+		if ((char *)entry + sizeof(struct f2fs_acl_entry_short) > end)
 			goto fail;
 
 		acl->a_entries[i].e_tag  = le16_to_cpu(entry->e_tag);
@@ -86,6 +86,8 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 			break;
 
 		case ACL_USER:
+			if ((char *)entry + sizeof(struct f2fs_acl_entry) > end)
+				goto fail;
 			acl->a_entries[i].e_uid =
 				make_kuid(&init_user_ns,
 						le32_to_cpu(entry->e_id));
@@ -93,6 +95,8 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
 					sizeof(struct f2fs_acl_entry));
 			break;
 		case ACL_GROUP:
+			if ((char *)entry + sizeof(struct f2fs_acl_entry) > end)
+				goto fail;
 			acl->a_entries[i].e_gid =
 				make_kgid(&init_user_ns,
 						le32_to_cpu(entry->e_id));


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLm1Hm5vu2nGjwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 04:37:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07D2C5978
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 04:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rhmkV/ndyHFkx3VQqLOrRSDgshOzG6iMjeO2sbw5Kb8=; b=lI0E2SxGHmTloe9VWc3NwnZ0Cl
	3Im7AYaKDEIdn1cgo324BwqG9hrXX3vYLbhaTtLq5zWhtr7Z9qp+HHRkd04b6DRlm8+7vtHBuNxRK
	qHkDbmP330McEB0okWLzGz/GZJCs7kfFnkt1emYyq+11S6PtS50dhCAZYM0QBuqsxGHY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w34C5-0003dc-2n;
	Thu, 19 Mar 2026 03:37:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1w34Bs-0003d5-41
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 03:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9aZC5KSiPpLsgrBubTTYXLhtxpbWFaK0/SDKknuNMh0=; b=Nx1hDX0Zyav6Gl3mxJjIMI4BDd
 /ZyMsBDxIy5MDVirUeZZDkvPIbWrjFDTDENiVc3XH+cCV1dwUaEAFeXIZ4/OjvANiU+dU7h618+wl
 mgiTomk5+sDB6XoXA6DJmkszEEYQnCFRNeF+qUJ+AohYkdp5JOIbqnNOXYNSUPrIIiIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9aZC5KSiPpLsgrBubTTYXLhtxpbWFaK0/SDKknuNMh0=; b=V
 LM/luZTBBqdmkWZGJR2teksSZXLYdZdWdyVUPJzxkNX6LSY8ATH6J4YX7KA/EgORR9ALMiXzJiEq1
 /OusTASL0d4kUaCCONEdkaNdTgAidSfg7G17JUW2O4QM+V6qXQhtSKU1sxOcRLmeduKqUU1iGTIDR
 V91o3SzCE+2i9NPs=;
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w34Br-0001iK-Hz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 03:36:56 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-35a1cc6e478so398787a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Mar 2026 20:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773891405; x=1774496205; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9aZC5KSiPpLsgrBubTTYXLhtxpbWFaK0/SDKknuNMh0=;
 b=BH51TlZBZzYo0SKTyeJIfqZV0p+7/zlkWt8Pyo/JwTyHC+25NRKh8E2unf/CBWHr4Y
 ZCU6Qv7BtJzW1iYGIGgCpMbGmAmwL9eJueFYUY+o+85tsG62ZJccKwcFLVI2JEnp1wD8
 Mq92yV1zKKwAEdWjCwItRWNvWMqUrnoVjOH2Axcacr4Mv0EnqQT8lC82xXotanaAzIPG
 bFV/O4pqV6eM1POdsdFpQZTLb8dB4i68flfHD9M7qXnstMaVFnCwVwEXjlpEhHDWDkQN
 QxnzH1pb+rm3YT0s+avvdHJpCjfc/Z/7lPG2BnLEommvCHotW959GBzr9y3Js2CErsGI
 HBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773891405; x=1774496205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aZC5KSiPpLsgrBubTTYXLhtxpbWFaK0/SDKknuNMh0=;
 b=kOpNyxID8NwHlEgFrnfKHmO4HH+CEYSzV/lbhJfeLTG9+cL0IEVO6nBmKiJZxqDU3t
 1tG4WUrYOENi2oYXfXVIwS0kMZBSRBfOKCYB4luWb6SndrMbdtpHCfQoupar4yZ2UufG
 FO+czlrnFtP8kPERilW4epr+G+NTFpHhyw9uUxd0WXUkNDL6wOOnc+woyBjcvhGLL9TM
 694c3M5LpkOyAJDgPXEBjiN0abLbk6rPSDtGtgomafFysDDRL+sRyrjSz2zKdQAcfQQl
 3Zjl7C873REB9VfLSF3j5YghGheAYoW134lIotNStB6uqtcfUca4hq6nDhJxL4j0AU10
 c9Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURnJgTdddtSVUEAAiYeMp+yigouD318FX20R8wPBxD1idO0yrh2pDzrrCM3shBO7sw+l8Li7G7a6iOkJuxiU60@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzBB+c9chigWNVx7EiZiqQhRdn1WLTRyT/0D6yPp3eicuuRZ4+0
 wjBrUWJpPZHo5PjHLuNZwlmy5FLmyov/UI7f/K397DfcEcEZO8/MhoszTuwHhQ==
X-Gm-Gg: ATEYQzzM5/gBy+Zfk6yNT+C8u9LjXWtlK4lgMOIdoRaIgNU7BHUWxbJ+3Kq8Rlyo8JQ
 TfuVwL3n6mmoxo8AX2N6k0/+3UwkROHclkDUxwVsRMmbfDhIRSoSmb7vF7ktbkWjeeSQ7HP4NKe
 RvgcwwdlUZXrYcq3NLmTUkhhZ/CCY6XTsyF3OrqFMDT1X9tCrxKo1L+CrzIUOJnNHVD7B2iXjDz
 tw1XvBeKa0nSBIXGXK6+T3ApPbAA+z7A1EhvvQhUdJub/eMahKq6vBO2GLlwK2x/hbcmbac4Q08
 tdcoi9kT+C8dIt8Q8cPWIOfzAv+Uu08wqg1WBKStlZI4kB6f3J4XWEIWil6TYNbUcVyB5yx9YYX
 NVbggOtAY15J9Szeun3h2x5WSbCV63z9SAU2GoTZTyC46BXm8XrDlqHQApmhieZ6gLU3TQ1R96a
 0mlrQ5tEpXwiIzE3UBYXuvEMrGWKbNfnE=
X-Received: by 2002:a17:90b:3d05:b0:35b:a7be:ae62 with SMTP id
 98e67ed59e1d1-35bb9f865admr4052049a91.30.1773891404831; 
 Wed, 18 Mar 2026 20:36:44 -0700 (PDT)
Received: from zyy.mioffice.cn ([2408:8607:1b00:8:de2a:6d3a:185:22cf])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35bbabae770sm1994294a91.1.2026.03.18.20.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 20:36:44 -0700 (PDT)
From: Yangyang Zang <zangyangyang66@gmail.com>
X-Google-Original-From: Yangyang Zang <zangyangyang1@xiaomi.com>
To: zlang@kernel.org
Date: Thu, 19 Mar 2026 11:35:18 +0800
Message-ID: <20260319033519.3954784-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  export F2FS_RESIZE_PROG w/ resize.f2fs, it can be used for
 resize f2fs. Cc: Jaegeuk Kim Cc: Chao Yu Signed-off-by: Yangyang Zang ---
 common/config | 1 + 1 file changed, 1 insertion(+) diff --git a/common/config
 b/common/config index 1420e35ddfee..d95b3226e85f 100644 --- a/common/config
 +++ b/common/config @@ -309, 6 +309,
 7 @@ export DUMP_F2FS_PROG=$(type -P dump.f2fs)
 export F2FS_IO [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [209.85.216.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [zangyangyang66(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [zangyangyang66(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.51 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w34Br-0001iK-Hz
Subject: [f2fs-dev] [PATCH 1/2] common/config: export F2FS_RESIZE_PROG
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Yangyang Zang <zangyangyang1@xiaomi.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:jaegeuk@kernel.org,m:zangyangyang1@xiaomi.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email,xiaomi.com:mid]
X-Rspamd-Queue-Id: BA07D2C5978
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

export F2FS_RESIZE_PROG w/ resize.f2fs, it can be used for resize f2fs.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
---
 common/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/common/config b/common/config
index 1420e35ddfee..d95b3226e85f 100644
--- a/common/config
+++ b/common/config
@@ -309,6 +309,7 @@ export DUMP_F2FS_PROG=$(type -P dump.f2fs)
 export F2FS_IO_PROG=$(type -P f2fs_io)
 export F2FS_INJECT_PROG=$(type -P inject.f2fs)
 export F2FS_FSCK_PROG=$(type -P fsck.f2fs)
+export F2FS_RESIZE_PROG=$(type -P resize.f2fs)
 export BTRFS_UTIL_PROG=$(type -P btrfs)
 export BTRFS_SHOW_SUPER_PROG=$(type -P btrfs-show-super)
 export BTRFS_CONVERT_PROG=$(type -P btrfs-convert)
-- 
2.43.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

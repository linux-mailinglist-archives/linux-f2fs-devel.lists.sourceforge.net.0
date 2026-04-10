Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILZ8IJ3/2Gl3kwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 15:48:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1C3D8504
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2026 15:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSHcZgGMqRLOEepD4OsBLx+o1l5fGxF25aR/Gq6A6p0=; b=LxD5Y9/KC3DYbqPGnC7z9wqdrm
	SV6k74JvNMVxSwdFYp2MSJq2m+BsLJM6x7KKtXRtC3JaSJKqdaHXJlNSY6G06jnxJ1Fyz0/SoO/SY
	4v4k7eD9Wdu5HPexxudnMy9QNRHVhNS4uSAiKpKl8oEDuFzdwkSPST4I9ruOrgWVqjsE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wBCDG-0006LL-Lc;
	Fri, 10 Apr 2026 13:47:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3t_jYaQwKAGIJPRUSAKOWSKIGOOGLE.COM@flex--jprusakowski.bounces.google.com>)
 id 1wBCDF-0006LE-7f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 13:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XBHYGu/W+MllWbifwusYwjsWD3CeuSoNa462jWa12vA=; b=aSWY1eANuNGzmVJomNCb2GLHnt
 fPmO1jH8NGEsyCKt9s/oZi5psqGQssdZcFNMBbJjMG8jIBNxfkSP8anAq3lMknSjPtpGuri0Uq24/
 nhw7vP45fhM05PtIUrFJv3EjQbkc2sCTpF69Q0V3d7kXvCYTWEjv760NvkkgKng8qzTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XBHYGu/W+MllWbifwusYwjsWD3CeuSoNa462jWa12vA=; b=J
 zYB12i4jaPFjsusEVyg4rVdWCHFXSJFoxpDXN8kn50VD07HIT6QIATY120fKveulvj7W0/wn9zvnP
 QuzSeJ8qsRwNveD+c5u3CTRMKHmg8NalcHR1qSSAAYfykfsaD54zk57zetxaumUSPBU/LmJGOEBcV
 IUwAmZbLicd/iRVk=;
Received: from mail-wr1-f73.google.com ([209.85.221.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wBCDE-0008C7-QL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Apr 2026 13:47:57 +0000
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-43b9a86b9b0so2228021f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Apr 2026 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1775828870; x=1776433670;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XBHYGu/W+MllWbifwusYwjsWD3CeuSoNa462jWa12vA=;
 b=gKCLv0Qj6spqZJU+e/4ahlvwH8g+BroesOXvdBjwqE9AQJexVU0+V5qUlJvnVlwUUC
 SjAsWix7rUXspO0EzcrdNipbwDEsuMSQDLFjmpLBXsMtcroowt8d3xyE2B+Uv3CW+9Ur
 itjkZqEIepQPI2Jf616lQA1ukHxyBs5eTt/67Q27dJ+TeEAiUgoxNP0Ne4iKmlZ573tx
 zlD/f3v4Rjd8EYlM9IX7+JzFi+pPlf/5tOpeRAntWt5TwPJluCv8DIBzGdAlYHg7SPbj
 NQGPgVBjXGo2PwpQ9C7+GCVyNneW0xrjSJHD42S6nPN+I+EUVqQ+2DScuVvhp8Y7aPVg
 HLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775828870; x=1776433670;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XBHYGu/W+MllWbifwusYwjsWD3CeuSoNa462jWa12vA=;
 b=OT9zde2wrSOdbgbv4a38KEdSjgP/6CHOSl/upbllBFYyN1zOruv4rNRvv5dP/KN+FO
 XSvImY36W72Z9i3rx/E59lu6g3WAJ8SirSc45mxZ1u1FOTOFcr7yqWa8FhQ1Ot+P5GSK
 QoYyUj4MSJvCUnOgAbpnqh0X8P3YFVjUx2XoWBT9AbjVA5942z9UtAGBC9T6JawgzMlL
 Z9OJJOa/q0eqziMd2D2unwRPcrWqRxgk7hxsYqtMdQ2q3PaRZ6bWoPwAwo5Kwy41JBIh
 GmgT+nQyUzgCyFNTdh6e4kTzvgk/Yw9tQGHD8CrYWdsScVYNjH/bDAhnZtOpSz+0ZU3K
 V9YQ==
X-Gm-Message-State: AOJu0YzSRO1TSU8zHPrDx2VsEC8CDNjXeB36dMAfruGKv1jSoxxI8gyC
 FYxMFR4hQUHYdw1/aNXLc4taMgXGfA10H4wbJ3z2mv2sK/o+kxQPKJAZt3qOueSm30om3QVCiiI
 9QuKq8kHfDcD8yu7ymscqwrO4i7/5xw==
X-Received: from ejcsa19.prod.google.com ([2002:a17:907:6d13:b0:b87:16d1:59a5])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c39a:b0:b97:aea3:86dc with SMTP id
 a640c23a62f3a-b9d727a0621mr177539466b.15.1775827127281; 
 Fri, 10 Apr 2026 06:18:47 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:18:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260410131821.991005-1-jprusakowski@google.com>
To: zlang@kernel.org, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS uses a checkpoint mechanism for metadata consistency
 rather than a traditional journal. Roll-forward recovery is only needed if
 there are fsync'd files since the last checkpoint. In this test case, files
 are created without fsync, so there is no roll-forward data to replay during
 mount. Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.73 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1wBCDE-0008C7-QL
Subject: [f2fs-dev] [PATCH] generic/050: handle f2fs as nojournal filesystem
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: wqu@suse.com, anand.jain@oracle.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:zlang@kernel.org,m:fstests@vger.kernel.org,m:wqu@suse.com,m:anand.jain@oracle.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,google.com:s=20251104];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,google.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jprusakowski@google.com]
X-Rspamd-Queue-Id: B9C1C3D8504
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

F2FS uses a checkpoint mechanism for metadata consistency rather than a
traditional journal. Roll-forward recovery is only needed if there are
fsync'd files since the last checkpoint.

In this test case, files are created without fsync, so there is no
roll-forward data to replay during mount.

Therefore, F2FS does not need to write to the device to recover, and
successfully mounts on the read-only block device. Thus, it should be
treated as nojournal in this case.

Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 tests/generic/050 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/generic/050 b/tests/generic/050
index 3bc37175..3a641a65 100755
--- a/tests/generic/050
+++ b/tests/generic/050
@@ -46,6 +46,18 @@ elif [ "$FSTYP" = "btrfs" ]; then
 	# So for this test case, btrfs will not get any dirty log tree thus
 	# it can be treated as "nojournal".
 	features="nojournal"
+elif [ "$FSTYP" = "f2fs" ]; then
+	# F2FS uses a checkpoint mechanism for metadata consistency rather than a
+	# traditional journal. Roll-forward recovery is only needed if there are
+	# fsync'd files since the last checkpoint.
+	#
+	# In this test case, files are created without fsync, so there is no
+	# roll-forward data to replay during mount.
+	#
+	# Therefore, F2FS does not need to write to the device to recover, and
+	# successfully mounts on the read-only block device. Thus, it should be
+	# treated as "nojournal" in this case.
+	features="nojournal"
 fi
 _link_out_file "$features"
 
-- 
2.53.0.1213.gd9a14994de-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

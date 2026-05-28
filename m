Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJs9Okm/F2rYPQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0A5EC5F1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 06:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEsAytxq6ImRIYD7vFz3DWgbKqnTrNDLkhx5G/ezvno=; b=hKTRSE8C3a7XqTNzcEU8zLya17
	ppKhuaS6jsK9g5ngpjb6gM29+eoM9nq3GIG9br4yz1ui+xTJ3pfKTpsai4EcCYkC3k31oRJS6Dlhn
	Nk9VeDwBzYoZPpLr52pjcBHR32nOegEnWVotZIFHLdxsuWSz3egHpypbk0bh7o0vL7vU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSS0v-000266-Oj;
	Thu, 28 May 2026 04:06:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wSS0u-00025y-8G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7yTvj2+iPY9bgL3Stb79PLfhmJb2V6kYoeFhUhcOQBo=; b=abIL4RiNgjgB/hUaWdfEs9jkVN
 XJTxkujal+NCIqGa4AFbk+WUDAQNlzEitlk5CeduNDcvF182qWLQI4n3sUe47h5HPEeoHrAdmYCTe
 MpJHgE0wKHZB3ItqSfntW9YeERUv+GHwE06FLelj6i4Zgx6n/m8KYeQuBYNRucRqO4oE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7yTvj2+iPY9bgL3Stb79PLfhmJb2V6kYoeFhUhcOQBo=; b=kXYSBwD9Uzgw9Lq9+KczRqZfQ9
 feVDFzjwtsw7xTRY/11ybKf+7EqfruBG6kQSMsWBZusc5BJBpq4nz7oSBrS8qTCnzoAD8SBoLyFpK
 2u4WIn1h0WMbv13g1/9yw2S9vhvsaYbDRCvaQ6UNgfl9IKws2lJnrT2VLU8r53GTKZ/M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSS0p-00025P-Th for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 04:06:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D2EA3605C4;
 Thu, 28 May 2026 04:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66DD1F00A3A;
 Thu, 28 May 2026 04:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779941177;
 bh=7yTvj2+iPY9bgL3Stb79PLfhmJb2V6kYoeFhUhcOQBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kJAsLqmVLMooIrhh/1vq1kc8PVAnOCsjVRIlmKT1UVoKB94KJ05Wu01IGMx21d9hx
 i767/nPAzXBTQBwYUfDsFPhFE5qPDcejnRq70BEnWAcZZ42gZVkCrdajAGs8yKXbC8
 M4FxIYjgIQGkktOFi3oX1RYMQia5zCYzrWGa2LmFSemih4PutaFvqklJhpYfuV73Vk
 xvpKmiOfjK+8UJXSbq2iXOmn9Fo+j724iQ1gc9Gx177rQeUhuqD6/Rs3oSosYy8swn
 2SVPXH+lJ5FxSsTUI59urvuQfzQlfhjS+4NOvwxvCHwRpA/fzlkjnxenDEZ5Y8Wpaz
 MdwWH+jyg7wcw==
To: fstests@vger.kernel.org
Date: Thu, 28 May 2026 12:05:34 +0800
Message-ID: <f4dc9d5af00133834acf97e1c72232d2a9b34ac6.1779939330.git.asj@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779939330.git.asj@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Define `FSNOTIFYWAIT_PROG` for an upcoming test case that
 uses `fsnotifywait`. Signed-off-by: Anand Jain <asj@kernel.org> ---
 common/config
 | 1 + 1 file changed, 1 insertion(+) diff --git a/common/config b/common/config
 index d5299d5b926f..5661fa0ec310 100644 --- a/common/config +++
 b/common/config
 @@ -242, 6 +242, 7 @@ export BTRFS_MAP_LOGICAL_PROG=$(type -P btrfs-map-logical
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wSS0p-00025P-Th
Subject: [f2fs-dev] [PATCH v6 03/11] fstests: add FSNOTIFYWAIT_PROG
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
From: Anand Jain via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Jain <asj@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[asj@kernel.org]
X-Rspamd-Queue-Id: 93B0A5EC5F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define `FSNOTIFYWAIT_PROG` for an upcoming test case that uses `fsnotifywait`.

Signed-off-by: Anand Jain <asj@kernel.org>
---
 common/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/common/config b/common/config
index d5299d5b926f..5661fa0ec310 100644
--- a/common/config
+++ b/common/config
@@ -242,6 +242,7 @@ export BTRFS_MAP_LOGICAL_PROG=$(type -P btrfs-map-logical)
 export PARTED_PROG="$(type -P parted)"
 export XFS_PROPERTY_PROG="$(type -P xfs_property)"
 export FSCRYPTCTL_PROG="$(type -P fscryptctl)"
+export FSNOTIFYWAIT_PROG="$(type -P fsnotifywait)"
 
 # udev wait functions.
 #
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

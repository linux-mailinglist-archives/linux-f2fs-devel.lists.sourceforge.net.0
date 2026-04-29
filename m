Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJYREL1p8WmhggEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 04:15:25 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A548E43B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 04:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/knnfc2wsqOmgEQfQeOJNjW9MD/Oibgh0n99Bdy7nBo=; b=TcQi+1Nij7kJLMAvN8owddMNN8
	GfW+AFWo+CO4VJfVrqlY3nYXdTw30qwef58vNGRBtgWt3YB9YS6UM5q9wMj8sVvxaQ2QfZNDUildD
	o99j2J+7OPKFRn5fBsDVAy2LykfVLqzUynuC48SQU0IU1VAqQZiIQ6wygqEEO+fS7l1I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHuSB-0005xv-4J;
	Wed, 29 Apr 2026 02:15:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wHuS8-0005xd-Tj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 02:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Enoky8THxeLu5AlbZAJhriZ2SNqPRrlzsay9VFs72io=; b=IN0YBD5ImKcZNbtwDoOOTMTFoZ
 jv8WSHA2xT/dozFtv6e2CmHJCf0kbY432+uktfQ0JI9iV//F0MmnWOPlkH6rwl7gYeU8S7h8kmfsR
 cTtNs4ntWEQlCffSTNi8RlPsHSqDaOAf9K8C8WSj9GqfpChoeU7KIH3qIBM1IbtzfY6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Enoky8THxeLu5AlbZAJhriZ2SNqPRrlzsay9VFs72io=; b=eSnWM32w5k0Hotoi0HE0irE5AQ
 hXLE6krEfzZklaGzwPqvC7ZL+Rhlz7WiusJNfoYlvSYrhZxUtOOtx6jB3XJnESMxeqDfrA+vP9gXC
 ggRAhNwAYM2sJbEWoJycazZiCR+JE3+4wArjCHOJ6sNwTPakctHZyuU66+ChlmWquEJw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHuS8-0007oH-Sy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 02:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 393636015B;
 Wed, 29 Apr 2026 02:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B7EC2BCB7;
 Wed, 29 Apr 2026 02:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777428893;
 bh=p54sB/AUYJK/XSKJbtpUI/rdZbOSQjmVqUdZNAW1ctk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lgDK40ym4JvlG15PLvTw/2n+hPSj8KOyZIhs+BoPUow1mXW7S10Dbuy7tpQzAOgdO
 vLGcBGSR+ilSYMbdpTzu+vQdx/XFTMf20pIqHRP6M0kojIdz2RJ7qBg3hXMxYMWSaL
 ygxBkwEU1v7br/EjNm287WGr/qpMI03CM1zPYO2ADPJiT3S4uCPFautrPX0qC33x2J
 x+UY93EZ4CYdLNtCiEvLVjUbJ6hjtfTgfct3Yeisggsyw8F1fD6jOSuLE3Dzdk4iWd
 XEkj5aduwedR1UN+3DKjz4V36nbBQPyOA3SrpXvXmxu8/LYK6G4Whmuy2kn7wefD5h
 EfohuvmQIYOhQ==
Message-ID: <a8a918ec-d5c5-46da-9226-ff1245fa55f1@kernel.org>
Date: Wed, 29 Apr 2026 10:14:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260427131050.1526593-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260427131050.1526593-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/26 21:10, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > When __destroy_extent_node() sets the inode
 flag FI_NO_EXTENT, it does > not reset the length of the largest [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wHuS8-0007oH-Sy
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix incorrect FI_NO_EXTENT handling
 in __destroy_extent_node()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: CF7A548E43B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]

On 4/27/26 21:10, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When __destroy_extent_node() sets the inode flag FI_NO_EXTENT, it does
> not reset the length of the largest extent to 0 and update the inode
> folio. Since modifications to the extent tree are disallowed afterward,
> the cached largest extent may become stale. This can trigger the
> following error in xfstests generic/388:
> 
> F2FS-fs (dm-0): sanity_check_extent_cache: inode (ino=1761) extent info [220057, 57, 6] is incorrect, run fsck to fix
> 
> In the f2fs_drop_inode path, __destroy_extent_node() does not need to
> guarantee that et->node_cnt is 0, because concurrency with writeback
> is expected in this path, and writeback may update the extent cache.
> 
> This patch reverts commit ed78aeebef05 ("f2fs: fix node_cnt race between
> extent node destroy and writeback"), and remove the unnecessary zero
> check of et->node_cnt.
> 
> Fixes: ed78aeebef05 ("f2fs: fix node_cnt race between extent node destroy and writeback")
> Cc: stable@vger.kernel.org
> Reported-by: Chao Yu <chao@kernel.org>
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

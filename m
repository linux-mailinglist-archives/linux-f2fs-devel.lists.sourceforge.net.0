Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN0zF2gdqGnyoAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 12:54:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95E1FF5B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 12:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1Vso1v3OchI71hKq7et6pAdp0EgFg/UX+wMsJ7+K8I=; b=T0DDS0CpPvPfjjTjXl0epuciaU
	qr/iljoXDLL0m3jTTJHDGY/Q8x+q1F0pr5yZHO/7QjJsUNI0FZUZviRZ0j8zZBqc+02QD0IFJebTH
	e2akT8o/bI9Sp/iMj8gVSzMEStV7L/+52FsxDJG8C+9FG8jEkUIg7hPAN2gZzrr21Y0E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxknu-0003WN-Gy;
	Wed, 04 Mar 2026 11:54:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxknt-0003WF-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 11:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yzRu4aOT2Cffprveb0NB+VWYA3QsuJt5HZLSm5ZogSA=; b=WxkCM1GVVTz9wKs0IW+H2ggfPR
 e2QhwGNT1I5gbm3WNTjSgyul8ICOpPz6Cu1K9fCZH6sWwpxY/HIaig48aeNzObBjQkwBqifFkyjGz
 N9jpU9hRGwyAngHhb0jjsTEoDjnf6f4QOFKuuZMVHDcxW9+Lr8ECcr0Yax0biQc62BF8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yzRu4aOT2Cffprveb0NB+VWYA3QsuJt5HZLSm5ZogSA=; b=O5FmZ5YgWqefNsV7kKqaoBNbCP
 5gsyjHGZZJHYRE09Y5tVaZtl64/6p3fIwr8NS9T9Q4LrwnvNYg0k9LUMMP/RWNqKFRgmmFrzp9Fie
 im5pNHjoXW1nviRzPVFpjJnmc86yXP25jeOHuqYKHrje/QzDRq2gezW6+rT8A0B/uk1w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxkns-0006hF-RQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 11:54:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 49550600AD;
 Wed,  4 Mar 2026 11:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEB7C19423;
 Wed,  4 Mar 2026 11:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772625240;
 bh=/01nl1T28FC/kCDbWHYz3Qa1fj+hPe3nbFwKD+bTfns=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fXOnDo1mqpKIm3N722BKaAp+smAfhv1c3VON7iSlRkoGc6Lge+uHwHzxb8uGg6vMY
 B2AIqyCIpUMOMZxMLvOABzUJlE1LQlK+X0WWwm+wp4uwmg94Y6qcuZGbBX3Lvr84Ll
 kMgwksWspYKXtinJ/D5AQ+QHUlUbPc+UOZCBobYHdhH04PoBW5cIojE8buT235O07P
 yXQc8pg0YL0LXVau2VcMXhUtDHnKsYIdBZEIgFWwmYirtn7tw8mBl6xOuvY1ctf2v5
 gGbitvIOjYYQRYn7evT5QQK9IO3QUHXJLEmm4eOqNSIjOGc3jQh67fd+mTdgPPate8
 UkvXzsMfin2xg==
Message-ID: <e43923c5-27f6-44c1-bb82-328fbe357283@kernel.org>
Date: Wed, 4 Mar 2026 19:53:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260227073052.3940958-2-monty_pavel@sina.com>
 <20260227073052.3940958-4-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260227073052.3940958-4-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/27 15:30, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > The sbi parameter in
 f2fs_in_warm_node_list()
 is not used. Remove it to > simplify the function. > > Signed [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxkns-0006hF-RQ
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: drop unused sbi parameter from
 f2fs_in_warm_node_list()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 1D95E1FF5B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.30.29.66:received,172.105.4.254:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 2026/2/27 15:30, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The sbi parameter in f2fs_in_warm_node_list() is not used. Remove it to
> simplify the function.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

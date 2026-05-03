Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGAmN5gN92lmbgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 10:55:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F04C4B4FDE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 10:55:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rNSDGO2BJeQ0u3c89/AFoz5uHanZBQ8a0911isl/VA=; b=mJoT5XACaWP9MRY5c+lxeGc7YA
	E8OxwYQNcbJTaXWYgbVGydLscYC3ktBlGlM3kQ0EPDRcWbAGity3xlb9r8KlILReP5TT6X72O36bm
	O1OPFj7npLVWcEP5iOqAV1OaU0YRUvgsi0R+KbFYWwz6sXv/ntabYnabGgRWEXZO14NA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJSc5-0000Ug-Hi;
	Sun, 03 May 2026 08:55:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wJSc3-0000Ua-4I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 08:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/VVVkx2rd6FzeC15TwErO11IjQqAXedt4+dNlLl5YzY=; b=ZkLJY34LmD6+TGAHOaCLuKXr9R
 aQv5AEBA/bucWpYMR51M5B3ac47KW6COPBX0I+OAXS0qjP8cGo6GSarq4njE70WlD8FyFFEJn6vWe
 ErCr71qSn36MxA+Npgn/biYjzpk12QWiXtCcKlYVpK44AjYSet2oXLC+KWfCyEom0IxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/VVVkx2rd6FzeC15TwErO11IjQqAXedt4+dNlLl5YzY=; b=RJx6SKkDj80EWffmdhHizORCrC
 MnwL7TzJ6OxNkjhvIyp4sV0pOfp0FfQs0gJuroiESjYyKO0oYiRAIh98FU4Dz3DAw8m8H0mFz/qoq
 d50P8MbaIWtMe8NfjXxpSu+Ub85yebaleOqDYUXozzkdZaU1mn6IKmGX/T6qz0SXR3EA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wJSc2-0000DZ-Nd for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 08:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 560B444485
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  3 May 2026 08:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77275C2BCB8;
 Sun,  3 May 2026 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777798532;
 bh=sJC1+8DNWFJZWkp48/qxnAlwYLEqEHKW5Oz072cPpn8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hyJqcbaRUTgIbPYkRB4INgzyzdokxy6VgdDQJhFAHHfeFzs2DMza8SyjC+DZfKKSg
 Bc96UIK0WViFJd7AgxgQmldSr8j+rHhKFC3wLlx39Oa4GHmH0FbyKdl8R7Jx6g5/Kv
 UPXiH9BLaFjrsCBkaSh8MCTgu8s4eW80jqoTFEOWm93pjMXEXetQaxFtux4zNMgeqq
 WdZvt8AvfJL2Ms9+T+8R+vVK0i8MZSKfDVrm1Ke5kWayrihW8gCGLKGdPIwQAJJdVZ
 a65tvWzJG16+/bPkv58tooygyHEhfJsdXUVBb8GALemSvNaadhQKA/K6g4pag165Yz
 C+Wi3Ur5amppQ==
Message-ID: <24e8b2b6-910a-4273-9009-e206c7fb95ae@kernel.org>
Date: Sun, 3 May 2026 16:55:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20260409134630.3693274-1-jaegeuk@kernel.org>
 <20260409134630.3693274-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20260409134630.3693274-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/9/26 21:46, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 We don't need O_RDONLY for fadvise. s/O_RDONLY/O_RDWR according to title
 & change? Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wJSc2-0000DZ-Nd
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs_io: user O_RDONLY for fadvise
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 8F04C4B4FDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

On 4/9/26 21:46, Jaegeuk Kim via Linux-f2fs-devel wrote:
> We don't need O_RDONLY for fadvise.

s/O_RDONLY/O_RDWR according to title & change?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   tools/f2fs_io/f2fs_io.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> index 8b9f9ef22eef..94e61b850923 100644
> --- a/tools/f2fs_io/f2fs_io.c
> +++ b/tools/f2fs_io/f2fs_io.c
> @@ -474,7 +474,7 @@ static void do_fadvise(int argc, char **argv, const struct cmd_desc *cmd)
>   		exit(1);
>   	}
>   
> -	fd = xopen(argv[4], O_RDWR, 0);
> +	fd = xopen(argv[4], O_RDONLY, 0);
>   
>   	if (!strcmp(argv[1], "willneed")) {
>   		advice = POSIX_FADV_WILLNEED;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

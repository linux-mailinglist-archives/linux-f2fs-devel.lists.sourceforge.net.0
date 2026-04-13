Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BNlJCm63GlCVwkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 11:40:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B86973E9F12
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 11:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cf1JzEHXrXygOQZjB8D3TwirsYzzsh4ZzsWQAAy/a2A=; b=ftZhF9tHCxuY7lcdpbYlyef/jn
	LJlAgsa7AEpRP6w65e9i7XFfpi12mWXiDpvuZCQkqdCcGbE1gFd2wEcPrilaMwvh8cCIrQ2d6Jata
	5evC6Yymn0va02aKeXYoO97ndjgdouccVMg8N+OL/6c+1YZp7ZwSnWrWEXd1HWD9a8ic=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCDmd-000881-Js;
	Mon, 13 Apr 2026 09:40:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wCDmb-00087t-Rc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 09:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aeYY6HyLt56NuodMxasJmmtmjNrcPe5IDwHw7OFRiXA=; b=Dxg43NqR9Hn/WmC/a3xHETj0KR
 /6GByq7Jlt43VyKZECP3zYfhyrzrU0exNeg1FZNJx8vIyxZYLR6NfLS2bZ+pXMkpON2vK+8hgAM6B
 GeRpndytsBXt8cVj7Sl2L7f51l+qb8V+HzxpDR4VMYbLt1CGi2FlbqSL0bFUZtwaDhS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aeYY6HyLt56NuodMxasJmmtmjNrcPe5IDwHw7OFRiXA=; b=O5Pa08aI3GwbJJd6sZLChFOm3D
 Ldft06cpA1VcNO1MeXCDH8seX6WYopmWwcoinUlTe8B9pj4MZ802scW7H3hScdAQOgjsGT6ThQrXA
 /vl3zd7tgxqMLSJ4fiuRzZNqMNrj/hZMaItWRH0M3NnqSoQxUlSQCh3ETEmlabwoHpGk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCDmb-0005y5-B2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 09:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BAD2541573
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 09:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8068EC116C6;
 Mon, 13 Apr 2026 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776073235;
 bh=8H6eo3yw58JLVrYE2pETANA18w4CJWqHWda3KTnA8Fg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=mtXljpZsh449AXWeuGCcWtkaLHjQzyF42ikkSOIX3YLVdI4VrdCVQWwuhEks2St9I
 YlEaD87TaKw1QKlf2i89waOr/jWOEwjDq9EnUwKRZJmz4uGRmIJuuftNk7o4/5nCxN
 A/0MjhFKZsoir0sVyTD2foLgpk/qVygyvBxeGMNcLW99r8gldJFjhFN5JQfBBFiQuy
 6gw4+nY/RfAFtYzTElO+orn9Fr5TZpIsCpQunMK+noHgwbH1k8TaOAKG3ptbhAT2ib
 fEm9a6ewjR3LNYIXr+koReL+xJqSJQcmZD1ko9p/GZWKukRTmJeK7t6DwMRTwwtmsH
 MIBMoeB7LwN/A==
Message-ID: <5cf2e3ba-c222-4ffb-8238-45d641f6f7c7@kernel.org>
Date: Mon, 13 Apr 2026 17:40:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260331174326.231867-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20260331174326.231867-1-jaegeuk@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/1/2026 1:43 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > The fsparam_string_empty() gives an error when mounting without string,
 since > its type is set to fsparam_flag in VFS. So, let's allow t [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wCDmb-0005y5-B2
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow empty mount string for
 Opt_usr|grp|projjquota
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
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: B86973E9F12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/2026 1:43 AM, Jaegeuk Kim via Linux-f2fs-devel wrote:
> The fsparam_string_empty() gives an error when mounting without string, since
> its type is set to fsparam_flag in VFS. So, let's allow the flag as well.
> 
> This addresses xfstests/f2fs/015 and f2fs/021.
> 

Fixes: d18535132523 ("f2fs: separate the options parsing and options checking") ?

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/super.c | 27 +++++++++++++++------------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5330ef981340..aab4345f3ee7 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -337,9 +337,12 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
>   	fsparam_flag("usrquota", Opt_usrquota),
>   	fsparam_flag("grpquota", Opt_grpquota),
>   	fsparam_flag("prjquota", Opt_prjquota),
> -	fsparam_string_empty("usrjquota", Opt_usrjquota),
> -	fsparam_string_empty("grpjquota", Opt_grpjquota),
> -	fsparam_string_empty("prjjquota", Opt_prjjquota),
> +	fsparam_string("usrjquota", Opt_usrjquota),
> +	fsparam_flag("usrjquota", Opt_usrjquota),
> +	fsparam_string("grpjquota", Opt_grpjquota),
> +	fsparam_flag("grpjquota", Opt_grpjquota),
> +	fsparam_string("prjjquota", Opt_prjjquota),
> +	fsparam_flag("prjjquota", Opt_prjjquota),
>   	fsparam_flag("nat_bits", Opt_nat_bits),
>   	fsparam_enum("jqfmt", Opt_jqfmt, f2fs_param_jqfmt),
>   	fsparam_enum("alloc_mode", Opt_alloc, f2fs_param_alloc_mode),
> @@ -980,26 +983,26 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>   		ctx_set_opt(ctx, F2FS_MOUNT_PRJQUOTA);
>   		break;
>   	case Opt_usrjquota:
> -		if (!*param->string)
> -			ret = f2fs_unnote_qf_name(fc, USRQUOTA);
> -		else
> +		if (param->type == fs_value_is_string && *param->string)
>   			ret = f2fs_note_qf_name(fc, USRQUOTA, param);
> +		else
> +			ret = f2fs_unnote_qf_name(fc, USRQUOTA);
>   		if (ret)
>   			return ret;
>   		break;
>   	case Opt_grpjquota:
> -		if (!*param->string)
> -			ret = f2fs_unnote_qf_name(fc, GRPQUOTA);
> -		else
> +		if (param->type == fs_value_is_string && *param->string)
>   			ret = f2fs_note_qf_name(fc, GRPQUOTA, param);
> +		else
> +			ret = f2fs_unnote_qf_name(fc, GRPQUOTA);
>   		if (ret)
>   			return ret;
>   		break;
>   	case Opt_prjjquota:
> -		if (!*param->string)
> -			ret = f2fs_unnote_qf_name(fc, PRJQUOTA);
> -		else
> +		if (param->type == fs_value_is_string && *param->string)
>   			ret = f2fs_note_qf_name(fc, PRJQUOTA, param);
> +		else
> +			ret = f2fs_unnote_qf_name(fc, PRJQUOTA);
>   		if (ret)
>   			return ret;
>   		break;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

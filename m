Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNqZAAIWGWoMqQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 06:28:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B125FCF83
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 06:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSLuiqWYxnoQo0j9XYrmjVZG7DE6MkkHCXuBgC5qcMA=; b=fB0ENwJHfd4s4MPfP8M/YHxqcP
	EwPciZWaytVdPPlwtXXoVuooXTwzI5IFpfz3JQ/yzwoN2kce9iK48Ia4wEcToJSAeMhyxZROXpFC2
	cG4YW9G8IYxugvTHKGqq3MGr31bPWWtw6AyzltYXko8kezdM2LAkrdJj25/em8xqmGrA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSopu-0007xt-56;
	Fri, 29 May 2026 04:28:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wSops-0007xk-KE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 04:28:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wRctoKAgX9QtpEjOGF4s9Ij+G4pcLZbM0Ees5Bf9rm0=; b=coNZlYOPWbxqAEdKfdo2tb4N7H
 u2Ygz6ErjInYOL3oK3CFyBg9jq9vcvgO1Awxu2zzfo+EY1YJZMjXGBRy9a906PiNjJzpG9U8mQrb2
 t28AxfD2N4Z+kkNuxiyYV9bu7OQbff1APXsBOcBC9Nmt47goJKJdZ2Jr9TXJRykEhF3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wRctoKAgX9QtpEjOGF4s9Ij+G4pcLZbM0Ees5Bf9rm0=; b=MejTIm7d5tGcpDzCiUNnGvkTKu
 +DNA5Iricop58jFVan4/bU/2U2RQPD6qjVniyD0zF4Jis3x0EC2a+CFYlt14wNcJYxKYBFT9DLZI4
 wgtjWl3kg/Rfw3LJ415OrJtBGcm8epikvBOf7ZUelLYQsgPD8Q/ikUf2yA1l5Pe8HIFc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSops-0007xo-2c for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 04:28:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id DE6A960213;
 Fri, 29 May 2026 04:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 864311F00893;
 Fri, 29 May 2026 04:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780028914;
 bh=wRctoKAgX9QtpEjOGF4s9Ij+G4pcLZbM0Ees5Bf9rm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ktoODV5N3m38PfT8oqUGjKpftZHxx3Kb1FjInuJjh7HMS/LpoDMy/2F5ZJgoDGTWS
 0deLsrOFBI1fXu1Lu5KRUTnhWPLNFvfP6F8hAcG0rXBTgL2TW2+XunxF/8SH2bZI4+
 nELHYQmvNgtT7RyZabk4UsRKcDnYo/DqOoPeBuiwGnF0lG/f01QsPkq+Sqi2qBAdoI
 H/tK/04yNDEbbzN02IaahoDwLZsoWyjo7dy/Fb1BdN45tjStgzZtriF6qc+6P1PDgR
 u9EfRfwdpeaCyoE+ETX7Qnz3zV5nIva2L4ZQ5Pb8UPzoXfO0Co08sjaC7Y4G2/j9X/
 eciXGRd0qiIiA==
Date: Thu, 28 May 2026 21:28:34 -0700
To: Anand Jain <asj@kernel.org>
Message-ID: <20260529042834.GC6070@frogsfrogsfrogs>
References: <cover.1779939330.git.asj@kernel.org>
 <4346c80089c61c8f0d62ea696f9d73f2a9669297.1779939330.git.asj@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4346c80089c61c8f0d62ea696f9d73f2a9669297.1779939330.git.asj@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 28, 2026 at 12:05:33PM +0800, Anand Jain wrote:
 > Adds _clone_mount_option() helper function to handle filesystem-specific
 > requirements for mounting cloned devices. Abstract the need for [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wSops-0007xo-2c
Subject: Re: [f2fs-dev] [PATCH v6 02/11] fstests: add _clone_mount_option()
 helper
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:asj@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: C9B125FCF83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 12:05:33PM +0800, Anand Jain wrote:
> Adds _clone_mount_option() helper function to handle filesystem-specific
> requirements for mounting cloned devices. Abstract the need for -o nouuid
> on XFS.
> 
> Signed-off-by: Anand Jain <asj@kernel.org>
> ---
>  common/rc | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/common/rc b/common/rc
> index d7e3e0bdfb1e..937f478963b4 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -414,6 +414,23 @@ _scratch_mount_options()
>  					$SCRATCH_DEV $SCRATCH_MNT
>  }
>  
> +# Return filesystem-specific mount options required for mounting clone/snapshot
> +# devices.
> +_clone_mount_option()
> +{
> +	local mount_opts=""
> +
> +	case "$FSTYP" in
> +	xfs)
> +		# Allow mounting a duplicate filesystem on the same host
> +		mount_opts="-o nouuid"
> +		;;
> +	*)
> +	esac
> +
> +	echo $mount_opts

I probably would've just echo'd straight from inside the case statement,
but this otherwise looks ok,
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +}
> +
>  _supports_filetype()
>  {
>  	local dir=$1
> -- 
> 2.43.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+TTIqDUJmpelQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:41:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D5C65766C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:41:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=BRhwH7oo;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=AvVrnc4j;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=YCV+wj4B;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=A4mtJ1L3;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Pco43Mskxm0R41ULbijQNt41xBObPYufAi/sO3dcsc=; b=BRhwH7ooztZswbUEYYb9QxyvGO
	2jYlvmnRjQtBNuyo7TFfl6x3BeRcQMur4DI8H2xzqE8aVCmMFafFDAYuBNYdYSz5zWT+4dHvfP7iU
	AOdHJ0+2V2skM7DXFdMdon6CDFTVufiOs326PfRMbMGt8BTCKgGdO4SB4JwGhNKjFTxE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wWbAO-0002nv-Qg;
	Mon, 08 Jun 2026 14:41:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wWbAN-0002np-KV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rnSeC72k3jfwAJFo9DXNXEkyjXtYEwqhDK65JbAiMEg=; b=AvVrnc4jtwLJzG3UYczDyOIjXm
 AZmZJzVsm6gP+7fRi5aRYWJHymOQaJgwQlnofT29MkX055uLgGTWPHXbinH7eG8H+boUzrk7dN1l1
 JRP+VCkDVJJYiRPOgcf1GOClvCY6szPdKaiyEQwnyr+F25A1HiLo8O844kvKxEwJGajY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rnSeC72k3jfwAJFo9DXNXEkyjXtYEwqhDK65JbAiMEg=; b=YCV+wj4Bpan0townoLajECgsGZ
 6gcoeJUr02BbrRGgIJknE5sfTe5Xr8OeqRXlZ0aHOb7BE5CPIJaDc1Sks2ZzHU+19uqZjvhrs6iiH
 tYetzma7C5X2Nvw1JEQvzvaUImVG9NDaEl4Za+ZdAhuOs8SH3EGZjfSSC2qMC4nO6LEQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wWbAL-0003uK-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:41:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3586543CB2;
 Mon,  8 Jun 2026 14:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCCD1F00898;
 Mon,  8 Jun 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780929675;
 bh=rnSeC72k3jfwAJFo9DXNXEkyjXtYEwqhDK65JbAiMEg=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=A4mtJ1L37lSvxT4FuxMY+NOf+tpa23K7Wec+UwtgEdf+7emCOq7qYQhBNSYDjjE4t
 tCv5nJ64IuZg71ns2H3kGLDtEo0+uWXQZ7wZ5fAY6DumHnA72XDAISYf8oww8xzWJw
 n6tMBlwDb774v18NsHF+xyx1jRgVLbM3uYaNutx6wIgAIJYN1pcwSAmti5rum+ZsiN
 i0ALTI/4Wjpbzcx/LEnIvEhoa2KE/kcXesYlvhVWWrBcQQcB21eA2RxQKIfiefgsin
 cdTz2ifN2XjWZcZfv5lPPom9cdaRBPFhz9T6zGfDIsk+GX2fAKDIK4fKis2VXr9S5z
 cuuZnQrqpvSCw==
Message-ID: <81df0458-5cd0-4d02-8382-36c583e5ca26@kernel.org>
Date: Mon, 8 Jun 2026 22:41:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
 <4346c80089c61c8f0d62ea696f9d73f2a9669297.1779939330.git.asj@kernel.org>
 <20260529042834.GC6070@frogsfrogsfrogs>
Content-Language: en-US
In-Reply-To: <20260529042834.GC6070@frogsfrogsfrogs>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 29/5/26 12:28, Darrick J. Wong wrote: > On Thu, May 28,
 2026 at 12:05:33PM +0800, Anand Jain wrote: >> Adds _clone_mount_option()
 helper function to handle filesystem-specific >> requirements for m [...]
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
X-Headers-End: 1wWbAL-0003uK-2Q
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
From: Anand Suveer Jain via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Suveer Jain <asj@kernel.org>
Cc: hch@infradead.org, zlang@redhat.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[asj@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1D5C65766C

On 29/5/26 12:28, Darrick J. Wong wrote:
> On Thu, May 28, 2026 at 12:05:33PM +0800, Anand Jain wrote:
>> Adds _clone_mount_option() helper function to handle filesystem-specific
>> requirements for mounting cloned devices. Abstract the need for -o nouuid
>> on XFS.
>>
>> Signed-off-by: Anand Jain <asj@kernel.org>
>> ---
>>  common/rc | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/common/rc b/common/rc
>> index d7e3e0bdfb1e..937f478963b4 100644
>> --- a/common/rc
>> +++ b/common/rc
>> @@ -414,6 +414,23 @@ _scratch_mount_options()
>>  					$SCRATCH_DEV $SCRATCH_MNT
>>  }
>>  
>> +# Return filesystem-specific mount options required for mounting clone/snapshot
>> +# devices.
>> +_clone_mount_option()
>> +{
>> +	local mount_opts=""
>> +
>> +	case "$FSTYP" in
>> +	xfs)
>> +		# Allow mounting a duplicate filesystem on the same host
>> +		mount_opts="-o nouuid"
>> +		;;
>> +	*)
>> +	esac
>> +
>> +	echo $mount_opts
> 
> I probably would've just echo'd straight from inside the case statement,

Nice. Let's see if there is v7, I will change this to as below.

> but this otherwise looks ok,
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> 
> --D
> 



diff --git a/common/rc b/common/rc
index 79be51e4da31..18d4f73cead9 100644
--- a/common/rc
+++ b/common/rc
@@ -418,17 +418,13 @@ _scratch_mount_options()
  # devices.
  _clone_mount_option()
  {
-       local mount_opts=""
-
         case "$FSTYP" in
         xfs)
                 # Allow mounting a duplicate filesystem on the same host
-               mount_opts="-o nouuid"
+               echo "-o nouuid"
                 ;;
         *)
         esac
-
-       echo $mount_opts
  }

  _supports_filetype()





>> +}
>> +
>>  _supports_filetype()
>>  {
>>  	local dir=$1
>> -- 
>> 2.43.0
>>
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

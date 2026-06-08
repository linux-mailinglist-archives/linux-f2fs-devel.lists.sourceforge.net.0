Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3jOGNSjUJmoxlQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:39:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5B6575C6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:39:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=O2Azmsnj;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=VWcI1YON;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=VCv9r0YE;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=BzxHlb01;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32CSjq4VVJ8guNJiCu7Ksmwv6gdEGH1rnslgHRC/7Y4=; b=O2AzmsnjsaRT78uoPrhXyGkC36
	p/5PJs0k8Z5jQ0W3JNfnGIr8U0nKR5u1zjGWgbMF2aWIiCCNHNvDfNYuTfGzS4CVjRskoNHAsFBSs
	aPaAvy1CYitkJaxIzZMFgcjmjF6uXkF1fNkChv65ynDNqdT0+cRU/MqaxYD+yUCMkcKE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wWb8N-0006xo-E5;
	Mon, 08 Jun 2026 14:39:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wWb8M-0006xi-Ph
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b2IFtj8GrIFcfIZoR8REKv1zaTaDXNqjayO7wEM71no=; b=VWcI1YONK+3EAQCcFeTL5DArag
 gb/986oeJUpgAMdrBpIODiw7KTuEm0MNsY8uX3/bhhe7ID/WTXeIlubF0A6JsDcZbWFlD4bO/cVnH
 4cneFL8ZIQ9O1U5TUddMsGMgjpqZwVKfcHoURSOOWVGt1wKf7P42rUuhxfS3YmimnasA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b2IFtj8GrIFcfIZoR8REKv1zaTaDXNqjayO7wEM71no=; b=VCv9r0YE9x5XXPaVPkGYTVdiVv
 FTVJOpm5C4kP2NukpTMcSMudwxn2L/oXEDKrXf7D78feQzq2Y40O4CbZNtQsjvg7CK1M0Gsnzhxz7
 cytJEK2C5zHbP3CQ12drvtILWVVvY9ckj11ApmUyG6B+WMFbxZNJ6SK4apRSWX6wsY78=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wWb8J-0003fG-2D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:39:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2F6D74332C;
 Mon,  8 Jun 2026 14:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6183B1F00898;
 Mon,  8 Jun 2026 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780929549;
 bh=b2IFtj8GrIFcfIZoR8REKv1zaTaDXNqjayO7wEM71no=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=BzxHlb01ARgm2lzi8SbGzOcsX4mGRQ8MAu9rvu3N3vgFzzZ2CKZK1x7BOruElyHt+
 FuxTReh67hbF0e0jJgoi+YaBTXy+8WjhQ1bcr1snZd6xZcozL41RMCH+tcci5WBpi4
 h/NaOarVTQ6hrihI3l3N54LD+SIG57NMPTfYkKoV9BorGrdQ+qv3RJLizbYwav60Rw
 dI8ubnz6eOS4cHH+AyUG9Npemc0M2uLTHFdRUomBcLsU44ER2v4zXV1PiuMUO4CBfu
 epEXt1IS6qUmNotNBXIWs7uA7UVBJH8jQwBJrpw58gxfg2bwyyLCV1yEsdlyQd8e6Q
 auHB1SIm6tXZg==
Message-ID: <9c0989d8-202f-42ab-9347-df082c25aa72@kernel.org>
Date: Mon, 8 Jun 2026 22:39:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
 <421c7cdd5aae27b99d04dddf08c5d9df79c2f790.1779939330.git.asj@kernel.org>
 <20260529042743.GB6070@frogsfrogsfrogs>
Content-Language: en-US
In-Reply-To: <20260529042743.GB6070@frogsfrogsfrogs>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 29/5/26 12:27, Darrick J. Wong wrote: > On Thu, May 28,
 2026 at 12:05:32PM +0800,
 Anand Jain wrote: >> Introduce _loop_image_create_clone()
 and _loop_image_destroy() to mkfs an >> image file and cl [...] 
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
X-Headers-End: 1wWb8J-0003fG-2D
Subject: Re: [f2fs-dev] [PATCH v6 01/11] fstests: add
 _loop_image_create_clone() helper
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:hch@infradead.org,m:zlang@redhat.com,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 25A5B6575C6

On 29/5/26 12:27, Darrick J. Wong wrote:
> On Thu, May 28, 2026 at 12:05:32PM +0800, Anand Jain wrote:
>> Introduce _loop_image_create_clone() and _loop_image_destroy() to mkfs an
>> image file and clone it to another image file, and attach a loop device to
>> them. And its destroy part.
>>
>> Signed-off-by: Anand Jain <asj@kernel.org>
>> ---
>>  common/rc | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>
>> diff --git a/common/rc b/common/rc
>> index 79189e7e6e94..d7e3e0bdfb1e 100644
>> --- a/common/rc
>> +++ b/common/rc
>> @@ -1520,6 +1520,69 @@ _scratch_resvblks()
>>  	esac
>>  }
>>  
>> +# Create a small loop image, run an optional tuning function ($2) on it,
>> +# clone it, and attach both to loop devices, returned in ($1).
>> +# Args:
>> +#   $1: Nameref to return the array of allocated loop devices [base, clone].
>> +#   $2: Optional callback function to tune the base filesystem before cloning.
>> +_loop_image_create_clone()
>> +{
>> +	local -n _ret=$1
> 
> That switch   ^^ is very clever.  I always wondered how one did indirect
> variables in bash.
> 
>> +	local pre_clone_tune_func="$2"
>> +	local img_file=$TEST_DIR/${seq}.img
>> +	local img_file_clone=$TEST_DIR/${seq}_clone.img
>> +	local size=$(_small_fs_size_mb 128) # Smallest possible
>> +	local loop_devs
>> +
>> +	# Since we copy the block device image, we keep its size small.
>> +	_require_fs_space $TEST_DIR $((size * 1024))
>> +
>> +	_create_file_sized $((size * 1024 * 1024)) $img_file ||
>> +				_fail "Failed: Create $img_file $size"
>> +
>> +	loop_devs=$(_create_loop_device $img_file)
>> +	_ret=($loop_devs)
> 
> Should this check that a loopdev actually got created?
> 

Hmm, in the function _create_loop_device(), we are
calling _fail if create fails, so no need to duplicate, right?

>> +	case $FSTYP in
>> +	xfs)
>> +		_mkfs_dev "-s size=4096" ${loop_devs[0]}
>> +		;;
>> +	btrfs)
>> +		_mkfs_dev ${loop_devs[0]}
>> +		;;
>> +	*)
>> +		_mkfs_dev ${loop_devs[0]}
>> +		;;
>> +	esac
>> +
>> +	# Only execute if the function argument is not empty
>> +	if [ -n "$pre_clone_tune_func" ]; then
>> +		$pre_clone_tune_func ${loop_devs[0]}
>> +	fi
>> +
>> +	sync ${loop_devs[0]}
>> +	cp $img_file $img_file_clone
>> +


>> +	loop_devs="$loop_devs $(_create_loop_device $img_file_clone)"
> 
> 	local lodev="$(_create_loop_device ...)"
> 
> 	test -z "$lodev" && _fail "second loopdev not created"
> 	_ret+=("$lodev")
> 
> ?

If the second `_create_loop_device()` happens to fail, it will
already have called `_fail`, so "second loopdev..." won't be
used at all.


Thanks, Anand



>> +
>> +	_ret=($loop_devs)
>> +}
>> +
>> +# Teardown loop devices and delete their underlying backing image files.
>> +# Accepts a list of loop device paths (e.g., /dev/loop0 /dev/loop1).
>> +_loop_image_destroy()
>> +{
>> +	for d in "$@"; do
>> +		# Retrieve the path of the backing file
>> +		local f=$(losetup --noheadings --output BACK-FILE $d)
>> +
>> +		# Detach the loop device from the backing file
>> +		_destroy_loop_device "$d"
>> +
>> +		# Clean up the backing disk image file
>> +		[ -n "$f" ] && rm -f "$f"
>> +	done
>> +}
>>  
>>  # Repair scratch filesystem.  Returns 0 if the FS is good to go (either no
>>  # errors found or errors were fixed) and nonzero otherwise; also spits out
>> -- 
>> 2.43.0
>>
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qmjsNxPVJmqFlQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:43:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D56576F8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 08 Jun 2026 16:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=hpWCWgf8;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Qp4VqEpl;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=ggj9oJKT;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=W4i6QXqc;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5d1wvjIWLh+K70+CupjaNB17AMzuUqdzE5Orrt3U0I=; b=hpWCWgf8oaZUG7iJpxdjTAHpod
	z52vLz52ZdKD6l+b+FWzVTeMT0Saw5KbIdcDXEGArpsj5fYjGPJpGNcQ440edW4Im7H60lRhytNyY
	aNtTEtxzaGSC4L1a32vHgy/SzE1BwonyvybYIhwcCV004xTuzbRgsN7kRHQj6ZPTJC2U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wWbCI-0004sf-89;
	Mon, 08 Jun 2026 14:43:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wWbCG-0004sX-Mg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4dzy65cV98nV8e9IEBBFsdPikjXLTPrbT+oXCXkGHLY=; b=Qp4VqEplcR3Z09ApJX/L+nd7KA
 ILodmHQhc5qg/OjXn1GygGpSSYV5YgJAw602fLFM7QtoRuo0kud5Is9P4hKT3C3BWYddNm/dD2T2Q
 slLgIjEElec5CAzWLP0JHuWKD1HtSYMwYKc01fSkq66YyvV2o55FrIQcBurBHY0LWEN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4dzy65cV98nV8e9IEBBFsdPikjXLTPrbT+oXCXkGHLY=; b=ggj9oJKT9Rq5oEyP3622V193OB
 FY5B8PNAwVEsf/y5wKAaHkPxtgOZiCJDTfmtF3WOFqlb970GEw42zqjaHwmEI3CqditGub0fR6KB9
 sLDkhF2q8mWsZRbo0mbhrMimB6vk846gz4baYlHTFTDGRMA96+D3Qux5Vd9iDIwRQqNg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wWbCD-00046J-Ij for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jun 2026 14:43:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C496043462;
 Mon,  8 Jun 2026 14:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE811F00893;
 Mon,  8 Jun 2026 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780929796;
 bh=4dzy65cV98nV8e9IEBBFsdPikjXLTPrbT+oXCXkGHLY=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=W4i6QXqcwQEexyBYFUFdL6Asf/5FsbSgO4HD3O1NcnjlTFB8ltWEMXRy6gpwM2haV
 tDVv9CAZEgB4ypNEZHpHqsNeqGHVtcW0jE/AVTm7BNXkwysvMRNfA/GkUFcwClDeR/
 SGgE4/lD7unGzEF7SsaW8Giyg2uCL1EIXWtLQrAKgotIPdNQoF1RAHQ42xRBOR3xAR
 vH1FjWjdogzYYOc94ME4PkgYHRB1Wta6/29OUlRpmEBBXdXC/3w20sJTDixZVyoomy
 0IJBHsL7TWxDsR1p/MKKrYTuEjfgLM+so9NY0I0AVXIc9IgzeGEc8kYXcWhIrUU7Ts
 f0x76aq/fLOww==
Message-ID: <0aa2ec2f-af87-49d8-b1a5-051720e06438@kernel.org>
Date: Mon, 8 Jun 2026 22:43:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Darrick J. Wong" <djwong@kernel.org>
References: <cover.1779939330.git.asj@kernel.org>
 <983ed0f63318c930379ee74220f23aa558c16d51.1779939330.git.asj@kernel.org>
 <20260529043056.GE6070@frogsfrogsfrogs>
Content-Language: en-US
In-Reply-To: <20260529043056.GE6070@frogsfrogsfrogs>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 29/5/26 12:30, Darrick J. Wong wrote: > On Thu, May 28,
 2026 at 12:05:35PM +0800, Anand Jain wrote: >> Add a helper to check if the
 target filesystem supports unique f_fsid >> tracking across clone [...] 
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
X-Headers-End: 1wWbCD-00046J-Ij
Subject: Re: [f2fs-dev] [PATCH v6 04/11] fstests: add
 _require_unique_f_fsid() helper
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
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
X-Rspamd-Queue-Id: 258D56576F8

On 29/5/26 12:30, Darrick J. Wong wrote:
> On Thu, May 28, 2026 at 12:05:35PM +0800, Anand Jain wrote:
>> Add a helper to check if the target filesystem supports unique f_fsid
>> tracking across cloned or snapshot instances.
>>
>> Certain filesystems like XFS, Btrfs, and F2FS ensure unique f_fsid
>> identifiers per filesystem instance. However, Ext4 derives its f_fsid
>> directly from its superblock UUID, which leads to identical f_fsid
>> values on cloned images until the UUID is manually modified by userspace.
>>
>> Introduce _require_unique_f_fsid() to allow test cases requiring strict
>> f_fsid uniqueness to skip gracefully on unsupported filesystems.
>>
>> Signed-off-by: Anand Jain <asj@kernel.org>
>> ---
>>  common/rc | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/common/rc b/common/rc
>> index 937f478963b4..5446552aed92 100644
>> --- a/common/rc
>> +++ b/common/rc
>> @@ -6314,6 +6314,27 @@ _require_fanotify_ioerrors()
>>  	_notrun "$FSTYP does not support fanotify ioerrors"
>>  }
>>  
>> +# Ext4 derives f_fsid from the superblock UUID, meaning clones share the
>> +# same f_fsid until their UUIDs diverge. Conversely, XFS, Btrfs,
>> +# and F2FS ensure f_fsid remains unique per filesystem instance (often by
>> +# deriving it from the UUID and underlying block device.)
>> +#
>> +# Across all filesystems, a UUID collision causes libblkid tools to return
>> +# non-deterministic device mappings. It is ultimately the responsibility
> 
> "device mappings", as in /dev/disk/by-id/$UUID ?
> 

Correct.. I'll make it specific.

>> +# of the userspace utility or use-case to enforce uniqueness when a clone
>> +# diverges. For details, see mailing list thread discussions titled:
>> +#      "ext4: derive f_fsid from block device to avoid collisions".
> 
> How about providing a direct lore link?
> 

Sure, that will be..

Link:
https://lore.kernel.org/linux-ext4/20260409131238.GC18443@macsyma-wired.lan/

instead of the title.

Thanks, Anand


> --D
> 




>> +_require_unique_f_fsid()
>> +{
>> +	# Skip the test if the filesystem does not enforce unique f_fsids
>> +	# natively. Checking this dynamically requires recreating a clone
>> +	# layout, so we use a static lookup based on FSTYP.
>> +	if [ "$FSTYP" == "ext4" ]; then
>> +		_notrun "Target filesystem ($FSTYP) does not guarantee unique f_fsid on clones."
>> +	fi
>> +}
>> +
>> +
>>  # Computes a percentage of the available space in a filesystem and
>>  # returns that quantity in MB. The percentage must not contain a percent
>>  # sign ("%").
>> -- 
>> 2.43.0
>>
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

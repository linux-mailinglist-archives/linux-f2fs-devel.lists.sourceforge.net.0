Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGU7J0Xx/mkdzwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 10:33:09 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 775EA4FEB4F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 10:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw2XDV6j8/5MwV2fb9UztfR/mHb2Xg2a0FNJXan65pM=; b=I59HPegKa2TrShYtgtkaTCjxiw
	8IgUxuew7PNdV7OI5DyfswQCycMfg+/bZM6jUJ6Koxb5sGVGLMdHv1E0xyhfLMNo8Ok6G+h65oOr0
	T0EFAA0Hy8O/voYLJAYNN99UCGJJVpjBPAipWzgwaoWA6WpgNMDP5xJv5muYUoqQJ7io=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLd7T-0006LU-FF;
	Sat, 09 May 2026 08:33:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wLd7S-0006Kv-Cl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 08:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z9Fg8gdbjJ0GLeMrSrvRMCluKPZFsFLom1GCpjuygHQ=; b=IppLm97X/HJxipkyPy+KUA0iAn
 SdKkbqCTs/oNmNJ1YZwkTd/VmPNSh2DBk0ahrlVPl7a9+3me96AL3ICn5hhdnc9x8DGwO4YK1uSob
 m6MkxBrMiylq45UyjskfluErSTdhcqNt+g5gtWjc1SUYLgZXNxlm9G4Fl6NjK9N5aA4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z9Fg8gdbjJ0GLeMrSrvRMCluKPZFsFLom1GCpjuygHQ=; b=Y/og9A/GFJVt2xfarBCHKUgbXy
 wqnqU364VyS8v3gOpN/2YmmMs5V+QkNubJhmGMLm6Rrz55NLmGahcV/RlSyKpEcNF1Zci0cXQRXWx
 psDKbw09eadBUeWoOJuSJK8vnacD/TqcLXlHnIlnDOb9qlT2/EO65y1x/m/9yTR9bYHw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLd7E-0005HN-HL for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 08:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D693D60008
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  9 May 2026 08:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E04C2BCB4;
 Sat,  9 May 2026 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778315566;
 bh=LnxCRcjoE9uShbElnhs84OujD/l6IMEYXYkRdx6Bjk4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=V+vtMTdYm3ntGy+I5622eUx/jn5cb6KDmOXjKsNJjOXcUW6JBFJn45Cp39d7Dvon2
 WqeQF9UCsitSU6qUzcfU+/EmcXEtIRsM6TcROpIi+sDYqpbM68ALarvIiM1+xVsrKo
 GIjlOvYmhC1TNdv7B6tHQtI3ygIb4vHKi2LLxcZ4p92cWEflD8rqkDEhTjKXATRPd0
 xptcPQL8McxXV0wVBlYi9KTbSUKomQVe7+9jYLj92klzwdnkPBUTh/n0Frc1UiP54J
 usxH5LNxG8H5LHy43lEV6jSgSp4rwFVITqUYCl1hhEnd3xTmIGpA6ZPxxW9xtJ9BOH
 artgtRLvO3kZA==
Message-ID: <57885017-dae2-4501-b6a7-828184f0cb9b@kernel.org>
Date: Sat, 9 May 2026 16:32:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20260409134630.3693274-1-jaegeuk@kernel.org>
 <af44Jz7JO2ZC502T@google.com>
Content-Language: en-US
In-Reply-To: <af44Jz7JO2ZC502T@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/9/26 03:23, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 [Script] > dd if=/dev/zero of=/mnt/test/test bs=1M count=1024 > f2fs_io
 setxattr
 user.fadvise 1 /mnt/test/test > chmod 0400 /mnt/test/test > [...] 
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
X-Headers-End: 1wLd7E-0005HN-HL
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs_io: support xattr(large_folio)
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
X-Rspamd-Queue-Id: 775EA4FEB4F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

On 5/9/26 03:23, Jaegeuk Kim via Linux-f2fs-devel wrote:
> [Script]
> dd if=/dev/zero of=/mnt/test/test bs=1M count=1024
> f2fs_io setxattr user.fadvise 1 /mnt/test/test
> chmod 0400 /mnt/test/test
> sync -f /mnt/test/test
> echo 3 > /proc/sys/vm/drop_caches
> f2fs_io read 1 0 100000 mmap 0 1 /mnt/test/test
> f2fs_io get_fadvise /mnt/test/test
> 
> [Output]
> 1024+0 records in
> 1024+0 records out
> 1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.520712 s, 2.1 GB/s
> setxattr /mnt/test/test CREATE: name: user.fadvise, value: 1: ret=0
> Read 409600000 bytes total_time = 106757 us, BW = 4286 MB/s, IO time = 95577 us, mlock time = 11173 us, print 1 bytes:
> 00000000 : 00
> fadvise=0x1, advise_type: largefolio
> 
> Reviewed-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

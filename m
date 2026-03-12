Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIVsDpwesmlwIwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 03:02:04 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAAB26C0E9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 03:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzk318/zSsPuThS7+y4922JBO8/ERBptACqICuC4h/I=; b=K7KgQQXerMnR5SVGlsKU7D8u6/
	4NtgFVfKb6hxq9LGKOet35QkjAwi3V9OHiRdkth+9HBLJ9Xq4OJqdMgo5uuzBA+hPoeEgqpFW1pO2
	pgv1Z8Igc/3P1CWA+pQffnE9yUr0KIX51S7s+minIBu7PXsvNeJGPqEjpU+gVzhZ5GJg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0VN5-000690-T3;
	Thu, 12 Mar 2026 02:01:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0VN5-00068m-1u
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 02:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ednwHbRPRvMOERbf8lQFfp7PPWIQKi0CV/dnQXUB9RI=; b=GoCgwKpniDH4auiih6knmDTKC4
 Q9QXdZiEoOkX6anF+vsyoEm295rGGnSCXZ5QPx62RC5iaZtnoGO03Lw0nPt6Nj5MhFxBeA4caJFFs
 j+jVxlHamQJZfv6Q7x+NDqM+i8Jph/w5/b93KfMzQfK/UxV1iY/1I3/rPiRYGeXIgUcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ednwHbRPRvMOERbf8lQFfp7PPWIQKi0CV/dnQXUB9RI=; b=If6Zfvd9kMWDjDFMQIJyTAyCtG
 FDYn+8GEpUsxcFgDyd5XdMvBuhsd+zMDt5SN4pfe+ASt0Rr1WPyue/fLzzbX4Nw2zbD3mhjWw+GJG
 s5gESxYom8mEgpX2n3cZn+5aajfgRnCErhZFlknyUE3r1ytp44l0I8CSSDV2weznhIxU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0VN5-0004xb-EN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 02:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 977F060141;
 Thu, 12 Mar 2026 02:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C4BC19421;
 Thu, 12 Mar 2026 02:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773280904;
 bh=vXYPN5qWNOwCZl2PPb8ENF7ESSrfj0IkQC0F2owwDjs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UaysYsnCdMkPTd1TXaczs1T0KaUWckPwlQVY5//ee8CkHVH8lrTVAehdoe9UbSV6v
 4ZMBKwJQX903SlTIKeTOa1BQUf9mGtL87yZNzdfFvslX8i4hWkaAWpgIwZ6Z1B2wdf
 5gh+ag1HsqnHPsvj+zUInVbuEzPtztCSnQzqWGBDvx24YvA3ofV+V+eSSyBQyL8+3d
 olqhxF4X+AKaEdjUQ60fdK9dayR46PGRzCoVtv0VZS2KGUltjt+cyMIphZKyM4Z43C
 wl81aVGMWf0uixz1oR8f6URcEnqbEu5IDVSscmT2kwhESHAzgcc4GWM9P3wI36h1DU
 Iz2q2GQ2rc5CA==
Message-ID: <6e89694d-5e3d-4d1c-91f6-56dcd36fcced@kernel.org>
Date: Thu, 12 Mar 2026 10:01:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20260311083530.2582720-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260311083530.2582720-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/11 16:35,
 Yangyang Zang wrote: > ad1357c34023 ("f2fs-tools:
 revert summary entry count from 2048 to > 512 in 16kb block support") changed
 the logic for migrating SSA > blocks, regardless of [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0VN5-0004xb-EN
Subject: Re: [f2fs-dev] [PATCH v3 1/3] resize.f2fs: fix to avoid zeroing
 main area blocks in migrate_ssa()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zangyangyang66@gmail.com,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: DCAAB26C0E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/11 16:35, Yangyang Zang wrote:
> ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to
> 512 in 16kb block support") changed the logic for migrating SSA
> blocks, regardless of whether the packed_ssa feature is enabled.
> During the reisze process, this patch may corrupt the file system
> root inode.
> 
> Reproducer:
> dd if=/dev/zero of=/data/f2fs.img bs=4k count=525312
> make_f2fs -g android /data/f2fs.img 131072
> resize.f2fs -F /data/f2fs.img
> mkdir /mnt/f2fs
> mount /data/f2fs.img /mnt/f2fs

Hi Yangyang,

Do you have any plan to wrap above testcase into xfsqa?

> 
> The root cause is that the number of SSA blocks after segment
> alignment is inconsistent with `get_newsb(segment_count)`.
> This may result in some SSA blocks not being zeroed out, or
> the main area blocks being incorrectly zeroed out during SSA
> migration. Zeroing out the main area blocks may corrupt the
> root inode.
> 
> Fixes: ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 512 in 16kb block support")
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

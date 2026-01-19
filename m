Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D576CD3AA9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycbbUdf1zeigwoBaOz8JxYQAL9ggKBAn87oH4m08GLY=; b=VlVEHFaRfgWI48zLR/yP3EGAtl
	qck8Ulqc392sFLDANh+tcHtcyz3G1bphN9IIEvfG1h/xO9Ep67SUFXXwChkQJtADo5SMhz8JGC2IY
	Tncj9Ey5Ok9WwTOrme5BmfZnfJzd/GJxAmFt+YFfvFjd9UPoU21W3LWs8A57r0La3CSI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpZ1-0001iI-Qv;
	Mon, 19 Jan 2026 13:45:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vhpYz-0001hW-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SQn1ofjh5YPjBZCzHKCUc0PZ1oWv/6keJF4c8SWQdEA=; b=M6KKuEe98LWQeZoL9ZyBjFB7Bi
 kEjyQhfY0nmopov7mlkmlIjvGyKnmrJUAVc5HG3MafErrw2VyYlnduyMMagjKZaghxP8QYo3fVI/t
 GpSo/w5h43Qx9yzwu8D5OlqPAZ9UU6I4WtfS2IhPng7Qr5e81i4CB61ZkhbbC/O9Fgog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SQn1ofjh5YPjBZCzHKCUc0PZ1oWv/6keJF4c8SWQdEA=; b=jH9Y5tJc0Bl5MYcoqZvsdn5PMg
 iAxbM0uzINjdHV+9ofVTOQV65Z9HlYnzgbQV7I5JQ9x4imVvKNJvA7lr5rsmzrMp3ENpX40CTzo+9
 YrHaTtJmRXlKsLHZAgZBAd2i1Glvc4gs1uxA/4T8okIrznkuzgxd5Fn1QvJSjEH/4oEk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpYy-0005UU-IN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0A0060155;
 Mon, 19 Jan 2026 13:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B655AC116C6;
 Mon, 19 Jan 2026 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830294;
 bh=xRH7BMwvRGAtAUjRAN0eWnx0hTH99JQz2hozrDCX5yc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nPxAVETIUl3BJxS2k8r51TyOaQFoiZIdVxG54tQnbRDKCQvD7LeMLp73vWBCHwxcc
 Ws+TI71YmSVL8Rt/5/plhJbMAtXXuTbfKB4l+BwCHUmh+3IGdEeDIZRhlezzlt/F/2
 0Mz5gGCO9r5ZpA+/qkbGoZSTt3G2bFNSl4nvO1A6i9ncHCkgJzddusJuPouJ833Vmm
 Jw75BUKBQ9fIaHeGUw+DHQ6B1CpjSnEPN21+t5N6X9BAt6ryrTCdRF6bydahd+CG7p
 CfkhEh6mYLAipAP8qYK0FHn6YFB61VnsL3HztggVnPgBygGc2LTrhyUBVmZWiCqYgA
 4UJHIF/xPSbjw==
Message-ID: <bf56a771-129b-4bf1-b5c7-05ecba6cda00@kernel.org>
Date: Mon, 19 Jan 2026 21:44:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>
References: <20260112013320.8028-1-chao@kernel.org>
 <5e888451-228e-41e5-ada7-a22a61cb84dd@126.com>
 <32fa7311-0393-4e71-a927-3c502e40efd8@kernel.org>
 <6d6b3bad.5f72.19bd535bd6d.Coremail.nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <6d6b3bad.5f72.19bd535bd6d.Coremail.nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/19/2026 3:43 PM,
 Nanzhe Zhao wrote: > Hi Chao: > At 2026-01-16
 16:52:02, "Chao Yu" <chao@kernel.org> wrote: >>> >>> Do we have plans to
 also support reducing f2fs_map_blocks() calls for >>> conse [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpYy-0005UU-IN
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid f2fs_map_blocks() for
 consecutive holes in readpages
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/19/2026 3:43 PM, Nanzhe Zhao wrote:
> Hi Chao:
> At 2026-01-16 16:52:02, "Chao Yu" <chao@kernel.org> wrote:
>>>
>>> Do we have plans to also support reducing f2fs_map_blocks() calls for
>>> consectives holes in logical file postion with dnode have already been
>>> allocated in buffered large folio read?
>>> Such as consective NULL_ADDR or NEW_ADDR?
>>
>> Nanzhe,
>>
>> We have supported that for large folio read w/ this patch?
>>
>> Thanks,
>>
> 
> Sorry, I'm a bit confused.
> In the condition of F2FS_MAP_BLOCK_DEFAULT, the default: case will only
> set map->m_next_pgofs to pgofs + 1 then sync out. When we enter
> next iteration and the index advanced, currrent index now turns to pgofs + 1
> and index < next_pgofs become false.In consequence, we won't reduce
> f2fs_map_blocks() calls for hole with dnode allocated.
> 
> Also, for NEW_ADDR, the default: case will directly go to sync out and bypass
> map_is_mergeable, so it will also not reduce f2fs_map_blocks calls.
> 
> Or am I missing something?

I guess f2fs_map_no_dnode() will update map->m_next_pgofs to pgofs of next
potential valid dnode.

Thanks,

> 
> Thanks,
> Nanzhe Zhao



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

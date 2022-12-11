Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 491486492A6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 07:04:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4FRf-00068T-Di;
	Sun, 11 Dec 2022 06:04:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4FRe-00068N-1N
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 06:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1EnAx1geRWwCfFzlBGrx4cqIztH4USU76VYUhrnSf9o=; b=bX0S3JaPfvxci3lE0VFsKuVT4J
 y9dCp1GjDabxY9DxRcWtKHPyTCwkFnER2hlJFYlgodKtqzXwScaIIrWR7fPwuxMiO791sIKeZLhht
 kHu+KFcVRTGpXiPQA10aRZA1i9+y+xVyduDW6iq+QiOePsFvtk3nQQwWWx5KQgWAVw6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1EnAx1geRWwCfFzlBGrx4cqIztH4USU76VYUhrnSf9o=; b=nNdoxjxr2IK1gAqRioAL8lXzSU
 MyqsN1zjgqWB7hyOmGLK7hC7tzgugvoh89brsqqXwyB5h325LeeIe/G523v/KIEVo8XFOT/iAyrBe
 WJaW52oQzqOfc9+F0UscdmvNTHHf18YNdgqutUh7jqKdZwGg/2vhaPT6Geh+aFuIoAK0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4FRY-00DY8D-QQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 06:04:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61B2F60C99;
 Sun, 11 Dec 2022 06:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34B2C433D2;
 Sun, 11 Dec 2022 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670738642;
 bh=U9Rhp55xf6rXsF3RAaS6Y+CbURUJS89vuN+H36qlHoI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gvn7tDTwTp770J0jxxGbJ/eD63c2MIQ371jcBZF6XySVsl5cwc/6/VJo7EmthNzpR
 ox3i1TMBwhRRllHhRuEMj7/Ug14/jRwkSLG9TzG1xFIyrs+jBie1F8LMjwY/9KeJtK
 eIJeshb0ZiuFM2HlcrQabSdC3HRmw7LCtQjh0nG2y2NaUW5CC69gWekQmEFR96jvA+
 W3ZPJEJYx+e3y7DQ4q8N6XLP/qxyzl9WAQoFLBlxikvESbccCCFgAfPRaObz5IC/oX
 VspM7gm8zxvpsnKEKbW6OjUEbeBubLYFyePfm/TrC3WWIJWxybX8d6rAxbBHKq/UQM
 W5JZ+7R9vuEBQ==
Message-ID: <489f2daa-4559-6c32-71e2-8bab65fb8154@kernel.org>
Date: Sun, 11 Dec 2022 14:03:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221102161031.5820-1-vishal.moola@gmail.com>
 <20221102161031.5820-17-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221102161031.5820-17-vishal.moola@gmail.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/3 0:10, Vishal Moola (Oracle) wrote: > Convert
 function to use folios throughout. This is in preparation for the > removal
 of find_get_pages_range_tag(). This change removes 5 calls to > co [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4FRY-00DY8D-QQ
Subject: Re: [f2fs-dev] [PATCH v4 16/23] f2fs: Convert
 f2fs_sync_meta_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/3 0:10, Vishal Moola (Oracle) wrote:
> Convert function to use folios throughout. This is in preparation for the
> removal of find_get_pages_range_tag(). This change removes 5 calls to
> compound_head().
> 
> Initially the function was checking if the previous page index is truly the
> previous page i.e. 1 index behind the current page. To convert to folios and
> maintain this check we need to make the check
> folio->index != prev + folio_nr_pages(previous folio) since we don't know
> how many pages are in a folio.
> 
> At index i == 0 the check is guaranteed to succeed, so to workaround indexing
> bounds we can simply ignore the check for that specific index. This makes the
> initial assignment of prev trivial, so I removed that as well.
> 
> Also modified a comment in commit_checkpoint for consistency.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

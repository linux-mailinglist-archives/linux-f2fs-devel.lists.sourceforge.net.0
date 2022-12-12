Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD064A39A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 15:42:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4k0Q-0005bx-1E;
	Mon, 12 Dec 2022 14:42:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4k0M-0005bU-00
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LetN+XiWqXiD7iYQvUHGp3bU4cjZ7Jb9FiyZhg2I1Dk=; b=bCvm5ItsH9qHAyvfERt9haje3x
 DcqWCASBtatusWaATekeWzV7dQ5DbvPHzV0OnAyzUTJipiVQGI301GWCB2vbUv5iVBaGKrkY47mWb
 R5Kp434ly3p7Xtz1BTeL3KTOGLqKi1ChDEAiesCGrpSRy4CfNkFMjsxFoBL9OU/QiolI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LetN+XiWqXiD7iYQvUHGp3bU4cjZ7Jb9FiyZhg2I1Dk=; b=hMfRmwR6F/E9lxmCinbZqHfJPF
 4nUIaN3yHPmoxVRS0hZp6FPxj67mg1ImScKXsGE6/4VUV7N7j07crApAkD4xfKX21d5Lrgqbqx5ZD
 Xk8C6QE0Y17VX74HWNwDFQCTdt9M9bkRCI0t1pnpgcTJC8M6Jy0up3QPdK8y86S+gKwg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4k0H-00Ep5n-N1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:42:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 656306111A;
 Mon, 12 Dec 2022 14:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CE0C433EF;
 Mon, 12 Dec 2022 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670856114;
 bh=49yiOOZXNHxawLGdF5jaeIemWnDUH+xC0nzErDnYjL4=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=n8xLMOU0bLG+06pQhoH9AbcOhe69C8Zly9RLAQ10uYBXbidwiMeWjZOvalz0iy3SD
 bheByXSHQ+WLsHN9KFYet/HV67Uj437+Q5xUEZP4ATjRAn0VGj8QOEm04zMRlp8MPe
 faogHkgm3YP1getVruEGkC4Lh1MR86MRnQJND1kfBzaQRawe5X3zL9S8LmY8RGBwya
 igwos3kMQ4claGjqRPg/VcBFUMKS3jOOwAnrAvdZ/1hX61RtYcwBA6LW86t7ksM/rc
 UW0Vnz7D5hGc38jpAX6MiZ31A969eZ+YuzJlUYUOG1or01nYfPtY2cU4bYkDtv/MS3
 0vUsMTm8qvbCw==
Message-ID: <0a95ba7b-9335-ce03-0f47-5d9f4cce988f@kernel.org>
Date: Mon, 12 Dec 2022 22:41:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Vishal Moola <vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-15-vishal.moola@gmail.com>
 <9c01bb74-97b3-d1c0-6a5f-dc8b11113e1a@kernel.org>
 <CAOzc2pweRFtsUj65=U-N-+ASf3cQybwMuABoVB+ciHzD1gKWhQ@mail.gmail.com>
 <CAOzc2pzoG1CN3Bpx5oe37GwRv71TpTQmFH6m58kTqOmeW7KLOw@mail.gmail.com>
 <CAOzc2pzp0JEanJTgzSrRt3ziRCrR6rGCjpwJvAD8uCqsHqXnHg@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAOzc2pzp0JEanJTgzSrRt3ziRCrR6rGCjpwJvAD8uCqsHqXnHg@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Vishal, Sorry for the delay reply. On 2022/12/6 4:34,
 Vishal Moola wrote: > On Tue, Nov 22,
 2022 at 6:26 PM Vishal Moola <vishal.moola@gmail.com>
 wrote: >> >> On Mon, Nov 14,
 2022 at 1:38 PM Vishal Moola <vishal.moola@gmail.com>
 wrote: [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4k0H-00Ep5n-N1
Subject: Re: [f2fs-dev] [PATCH v3 14/23] f2fs: Convert
 f2fs_write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Vishal,

Sorry for the delay reply.

On 2022/12/6 4:34, Vishal Moola wrote:
> On Tue, Nov 22, 2022 at 6:26 PM Vishal Moola <vishal.moola@gmail.com> wrote:
>>
>> On Mon, Nov 14, 2022 at 1:38 PM Vishal Moola <vishal.moola@gmail.com> wrote:
>>>
>>> On Sun, Nov 13, 2022 at 11:02 PM Chao Yu <chao@kernel.org> wrote:
>>>>
>>>> On 2022/10/18 4:24, Vishal Moola (Oracle) wrote:
>>>>> Converted the function to use a folio_batch instead of pagevec. This is in
>>>>> preparation for the removal of find_get_pages_range_tag().
>>>>>
>>>>> Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
>>>>> of pagevec. This does NOT support large folios. The function currently
>>>>
>>>> Vishal,
>>>>
>>>> It looks this patch tries to revert Fengnan's change:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=01fc4b9a6ed8eacb64e5609bab7ac963e1c7e486
>>>>
>>>> How about doing some tests to evaluate its performance effect?
>>>
>>> Yeah I'll play around with it to see how much of a difference it makes.
>>
>> I did some testing. Looks like reverting Fengnan's change allows for
>> occasional, but significant, spikes in write latency. I'll work on a variation
>> of the patch that maintains the use of F2FS_ONSTACK_PAGES and send
>> that in the next version of the patch series. Thanks for pointing that out!
> 
> Following Matthew's comment, I'm thinking we should go with this patch
> as is. The numbers between both variations did not have substantial
> differences with regard to latency.
> 
> While the new variant would maintain the use of F2FS_ONSTACK_PAGES,
> the code becomes messier and would end up limiting the number of
> folios written back once large folio support is added. This means it would
> have to be converted down to this version later anyways.
> 
> Does leaving this patch as is sound good to you?
> 
> For reference, here's what the version continuing to use a page
> array of size F2FS_ONSTACK_PAGES would change:
> 
> +               nr_pages = 0;
> +again:
> +               nr_folios = filemap_get_folios_tag(mapping, &index, end,
> +                               tag, &fbatch);
> +               if (nr_folios == 0) {
> +                       if (nr_pages)
> +                               goto write;
> +                               goto write;

Duplicated code.

>                          break;
> +               }
> 
> +               for (i = 0; i < nr_folios; i++) {
> +                       struct folio* folio = fbatch.folios[i];
> +
> +                       idx = 0;
> +                       p = folio_nr_pages(folio);
> +add_more:
> +                       pages[nr_pages] = folio_page(folio,idx);
> +                       folio_ref_inc(folio);
> +                       if (++nr_pages == F2FS_ONSTACK_PAGES) {
> +                               index = folio->index + idx + 1;
> +                               folio_batch_release(&fbatch);
> +                               goto write;
> +                       }
> +                       if (++idx < p)
> +                               goto add_more;
> +               }
> +               folio_batch_release(&fbatch);
> +               goto again;
> +write:

Looks fine to me, can you please send a formal patch?

Thanks,

> 
>> How do the remaining f2fs patches in the series look to you?
>> Patch 16/23 f2fs_sync_meta_pages() in particular seems like it may
>> be prone to problems. If there are any changes that need to be made to
>> it I can include those in the next version as well.
> 
> Thanks for reviewing the patches so far. I wanted to follow up on asking
> for review of the last couple of patches.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

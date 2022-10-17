Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E94A4600AF9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 11:36:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okMXy-0002NI-Sq;
	Mon, 17 Oct 2022 09:36:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1okMXr-0002N4-OG;
 Mon, 17 Oct 2022 09:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I/Ia4Mu9P3WluH4Bz+JF+Xw7+A6qmCSA4W2Y2iXMlFQ=; b=AZr403ghSJFdlGSG9qwbPK/Z+O
 vyVJ0nMkuYh+Z8fPZQWb96mSImaOLptXnHnb1dG9MGvQQC7U//r57PfPb0cLRddJ7OsehQBJtHBl+
 /KyXAo70EROenPedo8CngCR2Ry9f7oz8apxDRQnu2wHIep0iuJmkgG98tVnphN6Q3MmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I/Ia4Mu9P3WluH4Bz+JF+Xw7+A6qmCSA4W2Y2iXMlFQ=; b=ht2DZdZumimgcP0u34wyCfSi9J
 kbvFrGDiUz/llLy2T7tIU6/u5UJEAYkDCGzrbw2iq0gjZY4N9/o7TBu7zIhTOJJAa4Cyw7esu3lhA
 jGpEhl09LmFKHakLClqu7QDTxku7JntZaHPi5SHgUPgTySq/5FpMYwlL4D/cCcpIecUw=;
Received: from mout.gmx.net ([212.227.15.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okMXp-0008FF-0V; Mon, 17 Oct 2022 09:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1665999352;
 bh=TSo4xsvSk0OvKiVT30ycH0eaXfqa3xMOVrv3YjhH8gw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VDo8Gm0JgtzrHJ6Xii1dCvm/+Hg+CqD/gNGQx5qvTlNwGUtS/stHZhMQ0DtRJ7FTL
 oGQjIn1GNWtsDKdsBnqEvhXpqxlMvpkIeeMSyeO3skYwwnZFVB3bvCxS9z1b7KKbG+
 80m6RKMX91NnFVzzmsBldLgDnM8Md5Cf1lmocFHI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MKKUv-1oPoym2jZn-00LjgT; Mon, 17
 Oct 2022 11:35:52 +0200
Message-ID: <cae729f9-beea-ee04-1258-af393a858430@gmx.com>
Date: Mon, 17 Oct 2022 17:35:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Dmitry Vyukov <dvyukov@google.com>, Qu Wenruo <wqu@suse.com>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
 <20221014084837.1787196-4-hrkanabar@gmail.com>
 <5bc906b3-ccb5-a385-fcb6-fc51c8fea3fd@suse.com>
 <CACT4Y+YeSOZPN+ek6vSLhsCugJ3iGF35-sghnZt4qQJ36DA6mA@mail.gmail.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
In-Reply-To: <CACT4Y+YeSOZPN+ek6vSLhsCugJ3iGF35-sghnZt4qQJ36DA6mA@mail.gmail.com>
X-Provags-ID: V03:K1:R4tyK64oAk8yCJaovO8g6oIFOJ5yd0Mfld/q5wiz3kozqAwQUUS
 lpgS3cewdkbxgGeIFdnIcJLSyw3DqgqbHpMKqkq6iJMDWQK1v8r2vvpX8VoMHsrP7DJzziP
 MYTzi+9IfSzLElj6vjzmhop3w/xfDdajdqG4Xl7WiHTNsXM1dH86NANfkatxFl0VWhtQtc1
 LOWc73mYiVifySUhyiVYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P1Pf1vCA0Mo=:LdaK1AhKGgP6q3daQ1FgI+
 pBcZQ2/DqDbjSM/ch5Bo8GYYN5CIdcdy1krTo/c2d5EJLZaP7Ni+/vSh+QDYg8icdsJzrEJiV
 DyhpToTTOzaXYJHOfA/lkrQv03DT75BxKUcYYGw5z41+bZYilmhVlbDTEqV51rSB4lEQZWNkt
 gSv/3W+Kada62LM/xmsqFbFxex/RhjpOJjOz8kNWvnZX0gjjFS9cFs/k3PvcftPS4hTuhZG4w
 bftmdmcvxl3nDA88VlLFErj1cauYmH25vb0EQav9S5jO6XH4lPrAyseyUAlFXrtisV/PLH1ix
 Lr9t4TaaY1zXcO1xp7HBUKiOWI9f7DFv2LrulsEIizyYbV2JnHM11d/+upCrurY0QxNHq84ex
 EVJti0tJkcKvD+Je3sVxY7AkYJy69BqLjTzjqg7m2TaeB067VcveHqZgLhBkdVQ0bGLuwkvk7
 Gl5LA2uk9fwN9UzfBJA4d2ZJCGXE98HgeuyflZtJXL9pdJ7NNIdRY0Z4wAvUAO0QvFkmOtpCc
 zLk4KQu0sQom8HAzsZ80k2k//aHIjvfQ85lPWGYd0aQ1Ruz7FGTF+Mj1zXDFSOuGoKQAZ5Q2m
 YP7LNRSpMc9EP+hRceIdZUGd30O9ZQXYn+6u1L8IYfveqpqt9LbRCjzhuStZfrgDhh6ksWhzM
 GvOd24jy/UInX8Ie6LvqRk2igDeD8MXO0jzINQFZtbORPazSPd4tgmxZscp+SspyB3sVGHLlH
 HgWG0POeE0WOJ3HGjCSXA2ALMZ5MBDO0iwT2bJEknvt0HYviM5XJnV4c5KFVZn5UDtyopx3la
 raCwLOuRATRwc4cTbdoaTzo1XtAL/9JgyJIetUjGKyvZThZXPAhzgw1OgF2+w5Ct6bB0riOuu
 L/J4A+/Tmbet6i6U82+uDBbFeZcb7foWMdNdbRA9RdMKHhT+UXJuhNZEnnulLaf4pNwPBJMOk
 rpYdO9DiqW2bOxfHUVA5RUYrK4rrZMvnmiQ74XbvRGfpo2n4tq1KbJ2YCGDRq9IriS6QUl+WC
 i/lSljuZ7uOzf12RV7xD6we04YJ/imFRkMVxs4CjQKBAFc2q9ACwSDR2Xd0cSS68Og1UIuMBn
 61ALYMrd+wpPJcWbsG/76iN4SWlNye+A5svFDNfPSXLRUZYG0ukwegZr42+XlCCdK66ZEpuUA
 pkfUQVP5DciSSjxxW7NDON2BpahQ8jXq2OEbBeDKLaFVPG3lGdGt3vitfVoFqpb64rT+VGiLT
 Nf9hKGyDJ6O/AIFia3vUtEVE1VCHWoptVZcnMr3EjUwOkpPBISVqxh3NrYxfKqvhPZoLhEwSq
 NVvxK077sqqzQEdMrbxDx+FPG2JpS09q3z8NOyWs50rH0sYij6SkNDkN6gKRVLROpN8VJUCHB
 r3HCMIP1FWt6fJvB+UbEoTwOMypf+E+bukt/DG7PGLhO40nlidAdaUXlH1XaE39QnDYHetpAI
 Xa2bohRAwJVZMHI2pm2o6kSS+7/Se9dJSlJT+wViLdYj0TXA482aaFGEacRWLW+aXU1ylU65+
 yhaQqDUkEWCkmpa48nEPvmw2M0s2+k3ac4/v1BuqYzq8R
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/17 16:43, Dmitry Vyukov wrote: > On Fri, 14 Oct
 2022 at 12:24, 'Qu Wenruo' via kasan-dev > wrote: >> >> On 2022/10/14 16:48,
 Hrutvik Kanabar wrote: >>> From: Hrutvik Kanabar >>> >>> Whe [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.15.15 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.15 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [quwenruo.btrfs[at]gmx.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1okMXp-0008FF-0V
Subject: Re: [f2fs-dev] [PATCH RFC 3/7] fs/btrfs: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Hrutvik Kanabar <hrutvik@google.com>, kasan-dev@googlegroups.com,
 Hrutvik Kanabar <hrkanabar@gmail.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Marco Elver <elver@google.com>,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Anton Altaparmakov <anton@tuxera.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Aleksandr Nogikh <nogikh@google.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2022/10/17 16:43, Dmitry Vyukov wrote:
> On Fri, 14 Oct 2022 at 12:24, 'Qu Wenruo' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
>>
>> On 2022/10/14 16:48, Hrutvik Kanabar wrote:
>>> From: Hrutvik Kanabar <hrutvik@google.com>
>>>
>>> When `DISABLE_FS_CSUM_VERIFICATION` is enabled, bypass checksum
>>> verification.
>>>
>>> Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>
>>
>> I always want more fuzz for btrfs, so overall this is pretty good.
>>
>> But there are some comments related to free space cache part.
>>
>> Despite the details, I'm wondering would it be possible for your fuzzing
>> tool to do a better job at user space? Other than relying on loosen
>> checks from kernel?
>>
>> For example, implement a (mostly) read-only tool to do the following
>> workload:
>>
>> - Open the fs
>>     Including understand the checksum algo, how to re-generate the csum.
>>
>> - Read out the used space bitmap
>>     In btrfs case, it's going to read the extent tree, process the
>>     backrefs items.
>>
>> - Choose the victim sectors and corrupt them
>>     Obviously, vitims should be choosen from above used space bitmap.
>>
>> - Re-calculate the checksum for above corrupted sectors
>>     For btrfs, if it's a corrupted metadata, re-calculate the checksum.
>>
>> By this, we can avoid such change to kernel, and still get a much better
>> coverage.
>>
>> If you need some help on such user space tool, I'm pretty happy to
>> provide help.
>>
>>> ---
>>>    fs/btrfs/check-integrity.c  | 3 ++-
>>>    fs/btrfs/disk-io.c          | 6 ++++--
>>>    fs/btrfs/free-space-cache.c | 3 ++-
>>>    fs/btrfs/inode.c            | 3 ++-
>>>    fs/btrfs/scrub.c            | 9 ++++++---
>>>    5 files changed, 16 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/fs/btrfs/check-integrity.c b/fs/btrfs/check-integrity.c
>>> index 98c6e5feab19..eab82593a325 100644
>>> --- a/fs/btrfs/check-integrity.c
>>> +++ b/fs/btrfs/check-integrity.c
>>> @@ -1671,7 +1671,8 @@ static noinline_for_stack int btrfsic_test_for_metadata(
>>>                crypto_shash_update(shash, data, sublen);
>>>        }
>>>        crypto_shash_final(shash, csum);
>>> -     if (memcmp(csum, h->csum, fs_info->csum_size))
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         memcmp(csum, h->csum, fs_info->csum_size))
>>>                return 1;
>>>
>>>        return 0; /* is metadata */
>>> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
>>> index a2da9313c694..7cd909d44b24 100644
>>> --- a/fs/btrfs/disk-io.c
>>> +++ b/fs/btrfs/disk-io.c
>>> @@ -184,7 +184,8 @@ static int btrfs_check_super_csum(struct btrfs_fs_info *fs_info,
>>>        crypto_shash_digest(shash, raw_disk_sb + BTRFS_CSUM_SIZE,
>>>                            BTRFS_SUPER_INFO_SIZE - BTRFS_CSUM_SIZE, result);
>>>
>>> -     if (memcmp(disk_sb->csum, result, fs_info->csum_size))
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         memcmp(disk_sb->csum, result, fs_info->csum_size))
>>>                return 1;
>>>
>>>        return 0;
>>> @@ -494,7 +495,8 @@ static int validate_extent_buffer(struct extent_buffer *eb)
>>>        header_csum = page_address(eb->pages[0]) +
>>>                get_eb_offset_in_page(eb, offsetof(struct btrfs_header, csum));
>>>
>>> -     if (memcmp(result, header_csum, csum_size) != 0) {
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         memcmp(result, header_csum, csum_size) != 0) {
>>
>> I believe this is the main thing fuzzing would take advantage of.
>>
>> It would be much better if this is the only override...
>>
>>>                btrfs_warn_rl(fs_info,
>>>    "checksum verify failed on logical %llu mirror %u wanted " CSUM_FMT " found " CSUM_FMT " level %d",
>>>                              eb->start, eb->read_mirror,
>>> diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
>>> index f4023651dd68..203c8a9076a6 100644
>>> --- a/fs/btrfs/free-space-cache.c
>>> +++ b/fs/btrfs/free-space-cache.c
>>> @@ -574,7 +574,8 @@ static int io_ctl_check_crc(struct btrfs_io_ctl *io_ctl, int index)
>>>        io_ctl_map_page(io_ctl, 0);
>>>        crc = btrfs_crc32c(crc, io_ctl->orig + offset, PAGE_SIZE - offset);
>>>        btrfs_crc32c_final(crc, (u8 *)&crc);
>>> -     if (val != crc) {
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         val != crc) {
>>
>> I'm already seeing this to cause problems, especially for btrfs.
>>
>> Btrfs has a very strong dependency on free space tracing, as all of our
>> metadata (and data by default) relies on COW to keep the fs consistent.
>>
>> I tried a lot of different methods in the past to make sure we won't
>> write into previously used space, but it's causing a lot of performance
>> impact.
>>
>> Unlike tree-checker, we can not easily got a centerlized space to handle
>> all the free space cross-check thing (thus it's only verified by things
>> like btrfs-check).
>>
>> Furthermore, even if you skip this override, with latest default
>> free-space-tree feature, free space info is stored in regular btrfs
>> metadata (tree blocks), with regular metadata checksum protection.
>>
>> Thus I'm pretty sure we will have tons of reports on this, and
>> unfortunately we can only go whac-a-mole way for it.
>
> Hi Qu,
>
> I don't fully understand what you mean. Could you please elaborate?
>
> Do you mean that btrfs uses this checksum check to detect blocks that
> were written to w/o updating the checksum?

I mean, btrfs uses this particular checksum for its (free) space cache,
and currently btrfs just trust the space cache completely to do COW.

This means, if we ignore the checksum for free space cache, we can
easily screw up the COW, e.g. allocate a range for the new metadata to
be written into.

But the truth is, that range is still being utilized by some other
metadata. Thus would completely break COW.


This is indeed a problem for btrfs, but it is not that easiy to fix,
since this involves cross-check 3 different data (free space cache for
free space, extent tree for used space, and the metadata itself).

Thus my concern is, disabling free space cache csum can easily lead to
various crashes, all related to broken COW, and we don't have a good
enough way to validate the result.

>
>
>
>
>>>                btrfs_err_rl(io_ctl->fs_info,
>>>                        "csum mismatch on free space cache");
>>>                io_ctl_unmap_page(io_ctl);
>>> diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
>>> index b0807c59e321..1a49d897b5c1 100644
>>> --- a/fs/btrfs/inode.c
>>> +++ b/fs/btrfs/inode.c
>>> @@ -3434,7 +3434,8 @@ int btrfs_check_sector_csum(struct btrfs_fs_info *fs_info, struct page *page,
>>>        crypto_shash_digest(shash, kaddr, fs_info->sectorsize, csum);
>>>        kunmap_local(kaddr);
>>>
>>> -     if (memcmp(csum, csum_expected, fs_info->csum_size))
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         memcmp(csum, csum_expected, fs_info->csum_size))
>>
>> This skips data csum check, I don't know how valueable it is, but this
>> should be harmless mostly.
>>
>> If we got reports related to this, it would be a nice surprise.
>>
>>>                return -EIO;
>>>        return 0;
>>>    }
>>> diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
>>> index f260c53829e5..a7607b492f47 100644
>>> --- a/fs/btrfs/scrub.c
>>> +++ b/fs/btrfs/scrub.c
>>> @@ -1997,7 +1997,8 @@ static int scrub_checksum_data(struct scrub_block *sblock)
>>>
>>>        crypto_shash_digest(shash, kaddr, fs_info->sectorsize, csum);
>>>
>>> -     if (memcmp(csum, sector->csum, fs_info->csum_size))
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         memcmp(csum, sector->csum, fs_info->csum_size))
>>
>> Same as data csum verification overide.
>> Not necessary/useful but good to have.
>>
>>>                sblock->checksum_error = 1;
>>>        return sblock->checksum_error;
>>>    }
>>> @@ -2062,7 +2063,8 @@ static int scrub_checksum_tree_block(struct scrub_block *sblock)
>>>        }
>>>
>>>        crypto_shash_final(shash, calculated_csum);
>>> -     if (memcmp(calculated_csum, on_disk_csum, sctx->fs_info->csum_size))
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         memcmp(calculated_csum, on_disk_csum, sctx->fs_info->csum_size))
>>
>> This is much less valueable, since it's only affecting scrub, and scrub
>> itself is already very little checking the content of metadata.
>
> Could you please elaborate here as well?

These checksum verification is only done in the scrub path (just as the
file name indicates).

> This is less valuable from what perspective?

It's just much harder to trigger, regular filesystem operations won't go
into scrub path.

Unless there is also a full ioctl fuzzing tests, after corrupting the image.

> The data loaded from disk can have any combination of
> (correct/incorrect metadata) x (correct/incorrect checksum).
> Correctness of metadata and checksum are effectively orthogonal,

Oh, I almost forgot another problem with the compile time csum
verification skip.

If we skip csum check completely, just like the patch, it may cause less
path coverage (this is very btrfs specific)

The problem is, btrfs has some repair path (scrub, and read-time), which
requires to have a checksum mismatch (and a good copy with good checksum).

Thus if we ignore csum completely, the repair path will never be covered
(as we treat them all as csum match).

Thanks,
Qu

> right?
>
>
>
>> Thanks,
>> Qu
>>
>>>                sblock->checksum_error = 1;
>>>
>>>        return sblock->header_error || sblock->checksum_error;
>>> @@ -2099,7 +2101,8 @@ static int scrub_checksum_super(struct scrub_block *sblock)
>>>        crypto_shash_digest(shash, kaddr + BTRFS_CSUM_SIZE,
>>>                        BTRFS_SUPER_INFO_SIZE - BTRFS_CSUM_SIZE, calculated_csum);
>>>
>>> -     if (memcmp(calculated_csum, s->csum, sctx->fs_info->csum_size))
>>> +     if (!IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION) &&
>>> +         memcmp(calculated_csum, s->csum, sctx->fs_info->csum_size))
>>>                ++fail_cor;
>>>
>>>        return fail_cor + fail_gen;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

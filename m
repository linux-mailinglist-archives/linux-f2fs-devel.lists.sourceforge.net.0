Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57737B847
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 10:45:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgkUz-000133-3E; Wed, 12 May 2021 08:45:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daejun7.park@samsung.com>) id 1lgkUx-00012R-9h
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 08:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Z2RR6ZOichsiDtJveu33TpLXeJ/qtvzRwN/Sfz2qeA=; b=SXr0olCWlzwy4VMDmLMMbxXKxQ
 Y0iOb69IIgnwUnpOZ9sYRhGhkFcLwXXKZuLTFA5B8SJFk5xDWbowCw2xAJ28X3JlpXL/6YimVA6ZT
 Lr+SuPqkM1g5uEWTiIz6tmqqO/a8ikKWeFrGDzXYXzFnvY0ymO/nRbWj9mauD9kOGyJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Z2RR6ZOichsiDtJveu33TpLXeJ/qtvzRwN/Sfz2qeA=; b=kVno5blbpgKvufPFoqwBYxhkkC
 bClQQvK7MZMl1LWguohwsT8okM3NUxik4h3J7dTw8ujreTVEQHNc/XNxE8nFYa3+WXov0GqxvCQlf
 zd3JD+KHAFd8Qw/YdStVHSEXNuhz4czEvu2OxGopfGTAHWKfflwK0eRYxR8yhSmkvaLA=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgkUm-0008CX-OH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 08:45:42 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210512084522epoutp030252a0dccf27be26f315e949cb37cdeb~_RU8xfDC_3066630666epoutp03F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 May 2021 08:45:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210512084522epoutp030252a0dccf27be26f315e949cb37cdeb~_RU8xfDC_3066630666epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620809122;
 bh=3Z2RR6ZOichsiDtJveu33TpLXeJ/qtvzRwN/Sfz2qeA=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=nvS0F2Nvta/eWVtltrVM6jbGky+jT/kwXZ9eFazVoJdI7HB6XQLKdpXg3m5X9N1vX
 I0F7FFHf3w0MtJ6aaeyLfxM97lCjnnmngk5pLyqo72NbuUYf06XWF5brYEYWzIyDxk
 DwpHBZR2MD/YwZCnYkE3ijqyyiRQt8imxqc1zh/0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20210512084521epcas2p4a361350cac7e6788145f39ce698f0b95~_RU8VcJK10799407994epcas2p4W;
 Wed, 12 May 2021 08:45:21 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Fg7f75jPkz4x9QH; Wed, 12 May
 2021 08:45:19 +0000 (GMT)
X-AuditID: b6c32a47-f61ff700000024d9-45-609b959efe9d
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.08.09433.E959B906; Wed, 12 May 2021 17:45:18 +0900 (KST)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <YJr7axIRZcTDrAWE@google.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20210512084518epcms2p6ff55898e56e7232695a5054d9726250e@epcms2p6>
Date: Wed, 12 May 2021 17:45:18 +0900
X-CMS-MailID: 20210512084518epcms2p6ff55898e56e7232695a5054d9726250e
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphk+LIzCtJLcpLzFFi42LZdljTQnfe1NkJBh+XiFicnnqWyeLlIU2L
 VQ/CLZ6sn8VscWmRu8XlXXPYLKY+XsvqwO7RcuQtq8emVZ1sHrsXfGby6NuyitHj8ya5ANao
 HJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBuUFMoS
 c0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQWGhgV6xYm5xaV56XrJ+blWhgYGRqZAlQk5
 GTtm3WIquKRVcXmVWwPjHdkuRk4OCQETib1Nx1i6GLk4hAR2MEqs+HGPtYuRg4NXQFDi7w5h
 kBphAU+JdRdXsIHYQgJKEusvzmKHiOtJ3Hq4hhHEZhPQkZh+4j5YXETASeLrtSmsIDOZBZ4z
 Ssw7MokZYhmvxIz2pywQtrTE9uVbwZo5BbQkpvSuZYOIa0j8WNYLVS8qcXP1W3YY+/2x+YwQ
 tohE672zUDWCEg9+7oaKS0oc2/2BCcKul9h65xcjyBESAj2MEod33mKFSOhLXOvYCHYEr4Cv
 xIoXq8EWsAioSpx+uhLqOBeJrR8hFjMLyEtsfzuHGRQozAKaEut36YOYEgLKEkduscC81bDx
 Nzs6m1mAT6Lj8F+4+I55T6BOU5NY93M90wRG5VmIkJ6FZNcshF0LGJlXMYqlFhTnpqcWGxUY
 I8ftJkZwctRy38E44+0HvUOMTByMhxglOJiVRHjFkmYnCPGmJFZWpRblxxeV5qQWH2I0Bfpy
 IrOUaHI+MD3nlcQbmhqZmRlYmlqYmhlZKInz/kytSxASSE8sSc1OTS1ILYLpY+LglGpgqlT8
 zV1jZPf2RVLaBk7f6vSJPqn11eELZhedPDlj+s0PgV8S1l/9kJPNtt/4qghzaNm/Gwuk/uSv
 dyl51GgrrVfLFiIaVlZ5t2fTk6J9Rxl2Sl79xhGw9/sCA6kMt+XHbh7hcRZdbZSY1aW3+MSs
 LaYp84v2cibf/735g7Oo+kNma4aTU3/c8fye1cLHti8nr/BBfPlqi+zVV741y81xZmIIfnr/
 Um3LtEdfz3hcvOi/0i39bv2RQKPo6V3FbZt/uwnohfu5rH+z1bt5a9ai1TtdX+2YnX7V5cNp
 n9nTN27x+Mwqqz/N03hyVonZmgx2kVCuvxtvKavsci5j3iJzdbag7TfDm9c3uz85+mfxXCWW
 4oxEQy3mouJEAK+j4jkXBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a
References: <YJr7axIRZcTDrAWE@google.com>
 <20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p3>
 <3a0ab201-9546-d523-abc7-79df5f637f14@huawei.com>
 <YJN0nTgadoq8vDaG@google.com>
 <bd0fa15b-01c3-9f70-3eb8-ec2b54a0ee8f@huawei.com>
 <YJlHmP/ej8/IsHL3@google.com>
 <6e95edca-4802-7650-4771-5389067935dc@huawei.com>
 <YJoRcIpW1g/OgHZn@google.com>
 <20210511064156epcms2p1351480bea36733f2e00022bd295e829e@epcms2p1>
 <771a05fe-e26f-d635-5f8d-5be72f82345f@huawei.com>
 <CGME20210429062005epcms2p352ef77f96ab66cbffe0c0ab6c1b62d8a@epcms2p6>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgkUm-0008CX-OH
Subject: Re: [f2fs-dev] [PATCH] f2fs: set file as cold when file
 defragmentation
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
Reply-To: daejun7.park@samsung.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 05/11, Chao Yu wrote:
>> On 2021/5/11 14:41, Daejun Park wrote:
>> > > On 2021/5/11 13:09, Jaegeuk Kim wrote:
>> > > > On 05/11, Chao Yu wrote:
>> > > > > On 2021/5/10 22:47, Jaegeuk Kim wrote:
>> > > > > > On 05/06, Chao Yu wrote:
>> > > > > > > On 2021/5/6 12:46, Jaegeuk Kim wrote:
>> > > > > > > > On 05/06, Chao Yu wrote:
>> > > > > > > > > On 2021/4/29 14:20, Daejun Park wrote:
>> > > > > > > > > > In file defragmentation by ioctl, all data blocks in the file are
>> > > > > > > > > > re-written out-of-place. File defragmentation implies user will not update
>> > > > > > > > > > and mostly read the file. So before the defragmentation, we set file
>> > > > > > > > > > temperature as cold for better block allocation.
>> > > > > > > > > 
>> > > > > > > > > I don't think all fragmented files are cold, e.g. db file.
>> > > > > > > > 
>> > > > > > > > I have a bit different opinion. I think one example would be users want to
>> > > > > > > > defragment a file, when the they want to get higher read bandwidth for
>> > > > > > > 
>> > > > > > > Multimedia file was already defined as cold file now via default extension
>> > > > > > > list?
>> > > > > > 
>> > > > > > I just gave an example. And default is default.
>> > > > > > 
>> > > > > > > 
>> > > > > > > > usually multimedia files. That's likely to be cold files. Moreover, I don't
>> > > > > > > > think they want to defragment db files which will be fragmented soon?
>> > > > > > > 
>> > > > > > > I guess like db files have less update but more access?
>> > > > > > 
>> > > > > > I think both, and we set it as hot.
>> > > > > 
>> > > > > Then hot and cold bit will set to the same db file after defragmentation?
>> > > > 
>> > > > Do you set cold bit to db files? I mean, generally db is not cold, but hot.
>> > > 
>> > > I never set cold bit to db files, I mean if we defragment db file which
>> > > has less update and more access, db file may have bot hot and cold bit.
>> > > 
>> > > To Daejun, may I ask that is Samsung planning to use this defragment ioctl
>> > > in products? what's the user scenario?
>> > 
>> > It is just my idea for defragmentation, not Samsung.
>> 
>> Alright,
>> 
>> > I think the user will call the defrag ioctl for the files that have been updated.
>> 
>> Sadly, I don't see there is any user of this defragment interface since it was
>> been introduced... so I really don't know the real use scenario of this interface
>> now.
>> 
>> > 
>> > On the other hand, I think FS should be able to support defrag file even
>> > when in-place update is applied. What do you think?
>> 
>> bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
>> {
>>         if (f2fs_is_pinned_file(inode))
>>                 return true;
>> 
>>         /* if this is cold file, we should overwrite to avoid fragmentation */
>>         if (file_is_cold(inode))
>>                 return true;
>> 
>> If cold bit was set, later rewrite in defragment interface can only trigger
>> IPU due to above IPU policy check, so after this interface, file is still
>> fragmented... what's the difference compared to just setting cold bit via
>> setxattr?
>> 
>> And if user know that he will trigger less update and more read in the file,
>> why not just calling setxattr("system.advise", cold_bit) to set the file as
>> cold before it becomes fragmented, e.g. at the time of file creation?
> 
>yea, actually user can set it whatever they want after defragment. :P

I agree Chao yu's opinion so I drop this patch.

Thanks,
Daejun

> 
>> 
>> Thanks,
>> 
>> > 
>> > Thanks,
>> > Daejun
>> > > 
>> > > Thanks,
>> > > 
>> > > > 
>> > > > > 
>> > > > > Thanks,
>> > > > > 
>> > > > > > 
>> > > > > > > 
>> > > > > > > Thanks,
>> > > > > > > 
>> > > > > > > > 
>> > > > > > > > > 
>> > > > > > > > > We have separated interface (via f2fs_xattr_advise_handler, e.g. setfattr -n
>> > > > > > > > > "system.advise" -v value) to indicate this file is a hot/cold file, so my
>> > > > > > > > > suggestion is after file defragmentation, if you think this file is cold, and
>> > > > > > > > > use setxattr() to set it as cold.
>> > > > > > > > > 
>> > > > > > > > > Thanks,
>> > > > > > > > > 
>> > > > > > > > > > 
>> > > > > > > > > > Signed-off-by: Daejun Park <daejun7.park@samsung.com>
>> > > > > > > > > > ---
>> > > > > > > > > >       fs/f2fs/file.c | 3 +++
>> > > > > > > > > >       1 file changed, 3 insertions(+)
>> > > > > > > > > > 
>> > > > > > > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> > > > > > > > > > index d697c8900fa7..dcac965a05fe 100644
>> > > > > > > > > > --- a/fs/f2fs/file.c
>> > > > > > > > > > +++ b/fs/f2fs/file.c
>> > > > > > > > > > @@ -2669,6 +2669,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>> > > > > > > > > >               map.m_len = pg_end - pg_start;
>> > > > > > > > > >               total = 0;
>> > > > > > > > > > +        if (!file_is_cold(inode))
>> > > > > > > > > > +                file_set_cold(inode);
>> > > > > > > > > > +
>> > > > > > > > > >               while (map.m_lblk < pg_end) {
>> > > > > > > > > >                       pgoff_t idx;
>> > > > > > > > > >                       int cnt = 0;
>> > > > > > > > > > 
>> > > > > > > > .
>> > > > > > > > 
>> > > > > > .
>> > > > > > 
>> > > > .
>> > > > 
>> > > 
>> > > 
>> > .
>> > 
> 
> 
>  


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

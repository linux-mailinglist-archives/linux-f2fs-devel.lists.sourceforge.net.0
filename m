Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD897B5D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 00:42:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsaoq-0005tc-6l; Tue, 30 Jul 2019 22:42:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <anton@tuxera.com>)
 id 1hsaoo-0005tN-Rb; Tue, 30 Jul 2019 22:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=urmhA2y+GwgCsLzGj5ttvXejlOMHZLIWs5q1TOQVmXo=; b=ExJvCp65PjyI0kYez3ImJmT54x
 udygM+Y1Ot0bVX2rmwMdyjA/KVmPbGkl34FWn1aGNlu0FOxpx4lOtp12W4RhgtMFTttnvy8pn/Rv+
 dSwzoSidyFNE37WUUUs28K8+6K1En58zREKxsVV0gkDjEM2pZ5+wAsz8k6jM5cAmD1NE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=urmhA2y+GwgCsLzGj5ttvXejlOMHZLIWs5q1TOQVmXo=; b=P0AwAEzD8QnY3PkJnlixgo5tkv
 wp3aOPr4+dX6NFJDgwYeBt4OJql5Skc2fdM5k6pWjRASc0DJMPlJA4dJ6vjp5Aa8zlHw1R6VhpyBH
 rYV/qbA6NE88nAU+DxkRv+JLL+2MFvm4x00QZ463SIaIMSGe3ADYnZvt5jqcYK89DN08=;
Received: from mgw-02.mpynet.fi ([82.197.21.91])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsaok-001jPb-Si; Tue, 30 Jul 2019 22:42:06 +0000
Received: from pps.filterd (mgw-02.mpynet.fi [127.0.0.1])
 by mgw-02.mpynet.fi (8.16.0.27/8.16.0.27) with SMTP id x6UMSZio119596;
 Wed, 31 Jul 2019 01:28:35 +0300
Received: from ex13.tuxera.com (ex13.tuxera.com [178.16.184.72])
 by mgw-02.mpynet.fi with ESMTP id 2u0a9uvs4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 31 Jul 2019 01:28:34 +0300
Received: from tuxera-exch.ad.tuxera.com (10.20.48.11) by
 tuxera-exch.ad.tuxera.com (10.20.48.11) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 31 Jul 2019 01:28:34 +0300
Received: from tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789]) by
 tuxera-exch.ad.tuxera.com ([fe80::552a:f9f0:68c3:d789%12]) with mapi id
 15.00.1395.000; Wed, 31 Jul 2019 01:28:34 +0300
From: Anton Altaparmakov <anton@tuxera.com>
To: Deepa Dinamani <deepa.kernel@gmail.com>
Thread-Topic: [PATCH 03/20] timestamp_truncate: Replace users of
 timespec64_trunc
Thread-Index: AQHVRrCO7mUMDQahbUu7RSH43rBZCqbjOCQAgABUboA=
Date: Tue, 30 Jul 2019 22:28:33 +0000
Message-ID: <5340224D-5625-48A6-909E-70B24D2084BC@tuxera.com>
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
 <20190730014924.2193-4-deepa.kernel@gmail.com>
 <87d0hsapwr.fsf@mail.parknet.co.jp>
 <CABeXuvqgaxDSR8N_D1Tdw06g_5PGinZS--6nx-bPtAWP4v+mwg@mail.gmail.com>
In-Reply-To: <CABeXuvqgaxDSR8N_D1Tdw06g_5PGinZS--6nx-bPtAWP4v+mwg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [86.151.122.143]
Content-ID: <92684FF0F17B42478243313B03823A34@tuxera.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=800
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907300224
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: tuxera.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [82.197.21.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hsaok-001jPb-Si
Subject: Re: [f2fs-dev] [PATCH 03/20] timestamp_truncate: Replace users of
 timespec64_trunc
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
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 y2038
 Mailman List <y2038@lists.linaro.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Richard Weinberger <richard@nod.at>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 stoph Hellwig <hch@lst.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Deepa,

> On 30 Jul 2019, at 18:26, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> 
> On Tue, Jul 30, 2019 at 1:27 AM OGAWA Hirofumi
> <hirofumi@mail.parknet.co.jp> wrote:
>> 
>> Deepa Dinamani <deepa.kernel@gmail.com> writes:
>> 
>>> diff --git a/fs/fat/misc.c b/fs/fat/misc.c
>>> index 1e08bd54c5fb..53bb7c6bf993 100644
>>> --- a/fs/fat/misc.c
>>> +++ b/fs/fat/misc.c
>>> @@ -307,8 +307,9 @@ int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
>>>              inode->i_atime = (struct timespec64){ seconds, 0 };
>>>      }
>>>      if (flags & S_CTIME) {
>>> -             if (sbi->options.isvfat)
>>> -                     inode->i_ctime = timespec64_trunc(*now, 10000000);
>>> +             if (sbi->options.isvfat) {
>>> +                     inode->i_ctime = timestamp_truncate(*now, inode);
>>> +             }
>>>              else
>>>                      inode->i_ctime = fat_timespec64_trunc_2secs(*now);
>>>      }
>> 
>> Looks like broken. It changed to sb->s_time_gran from 10000000, and
>> changed coding style.
> 
> This is using a new api: timestamp_truncate(). granularity is gotten
> by inode->sb->s_time_gran. See Patch [2/20]:
> https://lkml.org/lkml/2019/7/29/1853
> 
> So this is not broken if fat is filling in the right granularity in the sb.

It is broken for FAT because FAT has different granularities for different timestamps so it cannot put the correct value in the sb as that only allows one granularity.  Your patch is totally broken for fat as it would be immediately obvious if you spent a few minutes looking at the code...

Best regards,

	Anton

> 
> -Deepa


-- 
Anton Altaparmakov <anton at tuxera.com> (replace at with @)
Lead in File System Development, Tuxera Inc., http://www.tuxera.com/
Linux NTFS maintainer



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

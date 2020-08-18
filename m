Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013C248261
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 11:59:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7yOj-0000fB-Qf; Tue, 18 Aug 2020 09:59:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k7yOg-0000ez-1v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 09:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/PT4skU2VVhiOFtufVIp9zYL79/R/t6E5U4+gjkelRw=; b=dkJlfgp503f4oo2tlf+xG4nS2n
 f6Z9jOLbNlTSY/LTr2pAZ2jBmEKgdA5xE0fjk5Yj7knabDqPYeF+1gmEtcyYweco98gU0/q50IfJL
 ZfNvAxxeMRNiS5a69CRoQzDcZaf+qJWM6hNkrayD7dIAgv1ei1sYzRcuQkP2Ss27NX/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/PT4skU2VVhiOFtufVIp9zYL79/R/t6E5U4+gjkelRw=; b=Ie/MLkdrKAjn6PUoGXk9cQzBgb
 tuofqv1wMAWurKjKSpSPb/NBNUkvGBW7bH3KZM940osL2rH9TGqO4k2gL0IV6ZJLkxJkN/AdO89nO
 ms6XoFRt7jkGExGkxKYsJEKws6k8ekj68AbPD8bSEdsOcPxy6VC2MlseV37iZxkAnOc8=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k7yOc-00BHtN-Ch
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 09:59:14 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 104E8EBCE2FB5F2C5F67;
 Tue, 18 Aug 2020 17:58:58 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 18 Aug
 2020 17:58:56 +0800
To: Theotime Combes <tcombes@google.com>
References: <20200813084202.2838098-1-tcombes@google.com>
 <5aa7a3bd-2bfc-f6a5-f08d-2a5b6c12be61@huawei.com>
 <CACGU_wB4kESZ0iqbfbSEO=FLkSRHoJOWESTi1uFHc8hEce9d=w@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <baab1444-cb7e-24b1-fc31-d18535ebf1eb@huawei.com>
Date: Tue, 18 Aug 2020 17:58:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACGU_wB4kESZ0iqbfbSEO=FLkSRHoJOWESTi1uFHc8hEce9d=w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k7yOc-00BHtN-Ch
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: add -r (fake_seed) and -T flags
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/18 17:43, Theotime Combes wrote:
> On Tue, Aug 18, 2020 at 10:26 AM Chao Yu <yuchao0@huawei.com> wrote:
>> On 2020/8/13 16:42, Theotime Combes via Linux-f2fs-devel wrote:
>>> r flag sets the checkpointing seed to 0 (initially used to
>>> remove randomness for apex generation).
>>> T flag sets timestamps to a given value.
>>
>> Normally, we introduce one feature in one patch...it helps review,
>> merge or revert patches more easily, how about splitting this into two.
>>
> 
> Sure, I'll split it into two.
> 
>>>
>>> Signed-off-by: Theotime Combes <tcombes@google.com>
>>> ---
>>>    include/f2fs_fs.h       |  3 ++-
>>>    man/mkfs.f2fs.8         | 13 +++++++++++++
>>>    mkfs/f2fs_format.c      | 26 ++++++++++++++------------
>>>    mkfs/f2fs_format_main.c | 10 +++++++++-
>>>    4 files changed, 38 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
>>> index a9982f0..76db3bf 100644
>>> --- a/include/f2fs_fs.h
>>> +++ b/include/f2fs_fs.h
>>> @@ -405,8 +405,10 @@ struct f2fs_configuration {
>>>        int large_nat_bitmap;
>>>        int fix_chksum;                 /* fix old cp.chksum position */
>>>        __le32 feature;                 /* defined features */
>>> +     time_t fixed_time;
>>>
>>>        /* mkfs parameters */
>>> +     int fake_seed;
>>>        u_int32_t next_free_nid;
>>>        u_int32_t quota_inum;
>>>        u_int32_t quota_dnum;
>>> @@ -427,7 +429,6 @@ struct f2fs_configuration {
>>>        char *mount_point;
>>>        char *target_out_dir;
>>>        char *fs_config_file;
>>> -     time_t fixed_time;
>>>    #ifdef HAVE_LIBSELINUX
>>>        struct selinux_opt seopt_file[8];
>>>        int nr_opt;
>>> diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
>>> index 022941f..5266dfd 100644
>>> --- a/man/mkfs.f2fs.8
>>> +++ b/man/mkfs.f2fs.8
>>> @@ -59,6 +59,9 @@ mkfs.f2fs \- create an F2FS file system
>>>    .B \-q
>>>    ]
>>>    [
>>> +.B \-r
>>> +]
>>> +[
>>>    .B \-R
>>>    .I root_owner
>>>    ]
>>> @@ -74,6 +77,10 @@ mkfs.f2fs \- create an F2FS file system
>>>    .I nodiscard/discard
>>>    ]
>>>    [
>>> +.B \-T
>>> +.I timestamp
>>> +]
>>> +[
>>>    .B \-w
>>>    .I wanted-sector-size
>>>    ]
>>> @@ -212,6 +219,9 @@ Default is disabled.
>>>    Quiet mode.
>>>    With it, mkfs.f2fs does not show any messages, including the basic messages.
>>>    .TP
>>> +.BI \-r
>>> +Sets the checkpointing srand seed to 0.
>>> +.TP
>>>    .BI \-R
>>>    Give root_owner option for initial uid/gid assignment.
>>>    Default is set by getuid()/getgid(), and assigned by "-R $uid:$gid".
>>> @@ -228,6 +238,9 @@ Enable sparse mode.
>>>    Specify 1 or 0 to enable or disable discard policy, respectively.
>>>    The default value is 1.
>>>    .TP
>>> +.BI \-T " timestamp"
>>> +Set inodes times to a given timestamp.
>>
>> Can we set this value to -1?
>>
> 
> -1 is used as an init value, therefore setting this value to -1 will
> fall back to using the current time. Should I specify it here ?

Yes, it's better to add it into manual, :)

Thanks,

> 
>>> +.TP
>>>    .BI \-w " wanted-sector-size"
>>>    Specify the sector size in bytes.
>>>    Without it, the sectors will be calculated by device sector size.
>>> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>>> index 1639752..e711982 100644
>>> --- a/mkfs/f2fs_format.c
>>> +++ b/mkfs/f2fs_format.c
>>> @@ -692,7 +692,7 @@ static int f2fs_write_check_point_pack(void)
>>>        }
>>>
>>>        /* 1. cp page 1 of checkpoint pack 1 */
>>> -     srand(time(NULL));
>>> +     srand((c.fake_seed) ? 0 : time(NULL));
>>>        cp->checkpoint_ver = cpu_to_le64(rand() | 0x1);
>>>        set_cp(cur_node_segno[0], c.cur_seg[CURSEG_HOT_NODE]);
>>>        set_cp(cur_node_segno[1], c.cur_seg[CURSEG_WARM_NODE]);
>>> @@ -1192,11 +1192,11 @@ static int f2fs_write_root_inode(void)
>>>        raw_node->i.i_size = cpu_to_le64(1 * blk_size_bytes); /* dentry */
>>>        raw_node->i.i_blocks = cpu_to_le64(2);
>>>
>>> -     raw_node->i.i_atime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_atime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>
>> How about wrapping
>>
>> (c.fixed_time == -1) ? time(NULL) : c.fixed_time)
>>
>> to inline function or macro?
> 
> I'll replace it with a macro in the new patch (once split),
> Thanks for the review!
> 
>>
>> Thanks,
>>
>>>        raw_node->i.i_atime_nsec = 0;
>>> -     raw_node->i.i_ctime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_ctime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_ctime_nsec = 0;
>>> -     raw_node->i.i_mtime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_mtime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_mtime_nsec = 0;
>>>        raw_node->i.i_generation = 0;
>>>        raw_node->i.i_xattr_nid = 0;
>>> @@ -1213,7 +1213,8 @@ static int f2fs_write_root_inode(void)
>>>                raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
>>>
>>>        if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
>>> -             raw_node->i.i_crtime = cpu_to_le32(time(NULL));
>>> +             raw_node->i.i_crtime = cpu_to_le32(
>>> +                     (c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>                raw_node->i.i_crtime_nsec = 0;
>>>        }
>>>
>>> @@ -1350,11 +1351,11 @@ static int f2fs_write_qf_inode(int qtype)
>>>        raw_node->i.i_size = cpu_to_le64(1024 * 6); /* Hard coded */
>>>        raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
>>>
>>> -     raw_node->i.i_atime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_atime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_atime_nsec = 0;
>>> -     raw_node->i.i_ctime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_ctime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_ctime_nsec = 0;
>>> -     raw_node->i.i_mtime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_mtime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_mtime_nsec = 0;
>>>        raw_node->i.i_generation = 0;
>>>        raw_node->i.i_xattr_nid = 0;
>>> @@ -1545,11 +1546,11 @@ static int f2fs_write_lpf_inode(void)
>>>        raw_node->i.i_size = cpu_to_le64(1 * blk_size_bytes);
>>>        raw_node->i.i_blocks = cpu_to_le64(2);
>>>
>>> -     raw_node->i.i_atime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_atime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_atime_nsec = 0;
>>> -     raw_node->i.i_ctime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_ctime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_ctime_nsec = 0;
>>> -     raw_node->i.i_mtime = cpu_to_le32(time(NULL));
>>> +     raw_node->i.i_mtime = cpu_to_le32((c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>        raw_node->i.i_mtime_nsec = 0;
>>>        raw_node->i.i_generation = 0;
>>>        raw_node->i.i_xattr_nid = 0;
>>> @@ -1569,7 +1570,8 @@ static int f2fs_write_lpf_inode(void)
>>>                raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
>>>
>>>        if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
>>> -             raw_node->i.i_crtime = cpu_to_le32(time(NULL));
>>> +             raw_node->i.i_crtime = cpu_to_le32(
>>> +                     (c.fixed_time == -1) ? time(NULL) : c.fixed_time);
>>>                raw_node->i.i_crtime_nsec = 0;
>>>        }
>>>
>>> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
>>> index 27c1f1d..4acc42a 100644
>>> --- a/mkfs/f2fs_format_main.c
>>> +++ b/mkfs/f2fs_format_main.c
>>> @@ -59,10 +59,12 @@ static void mkfs_usage()
>>>        MSG(0, "  -C [encoding[:flag1,...]] Support casefolding with optional flags\n");
>>>        MSG(0, "  -p number of pinned segments (2MB) [default:0]\n");
>>>        MSG(0, "  -q quiet mode\n");
>>> +     MSG(0, "  -r set checkpointing seed (srand()) to 0\n");
>>>        MSG(0, "  -R root_owner [default: 0:0]\n");
>>>        MSG(0, "  -s # of segments per section [default:1]\n");
>>>        MSG(0, "  -S sparse mode\n");
>>>        MSG(0, "  -t 0: nodiscard, 1: discard [default:1]\n");
>>> +     MSG(0, "  -T timestamps\n");
>>>        MSG(0, "  -w wanted sector size\n");
>>>        MSG(0, "  -z # of sections per zone [default:1]\n");
>>>        MSG(0, "  -V print the version number and exit\n");
>>> @@ -124,7 +126,7 @@ static void add_default_options(void)
>>>
>>>    static void f2fs_parse_options(int argc, char *argv[])
>>>    {
>>> -     static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:R:s:S:z:t:U:Vfw:";
>>> +     static const char *option_string = "qa:c:C:d:e:E:g:il:mo:O:p:rR:s:S:z:t:T:U:Vfw:";
>>>        int32_t option=0;
>>>        int val;
>>>        char *token;
>>> @@ -187,6 +189,9 @@ static void f2fs_parse_options(int argc, char *argv[])
>>>                case 'p':
>>>                        c.pinned_segments = atof(optarg);
>>>                        break;
>>> +             case 'r':
>>> +                     c.fake_seed = 1;
>>> +                     break;
>>>                case 'R':
>>>                        if (parse_root_owner(optarg, &c.root_uid, &c.root_gid))
>>>                                mkfs_usage();
>>> @@ -205,6 +210,9 @@ static void f2fs_parse_options(int argc, char *argv[])
>>>                case 't':
>>>                        c.trim = atoi(optarg);
>>>                        break;
>>> +             case 'T':
>>> +                     c.fixed_time = strtoul(optarg, NULL, 0);
>>> +                     break;
>>>                case 'U':
>>>                        c.vol_uuid = strdup(optarg);
>>>                        break;
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A701E7BB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 06:51:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQlsh-0002JH-0R; Wed, 15 May 2019 04:51:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hQlsf-0002J8-Sh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 04:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L9ndETiZ6ydBIdtdPhUq29jf2zBhpAg9bXwFoPQZIro=; b=EY6FclyY7lWOR8qgdnKsDr0gzY
 Ih4r8u+fEeVAjSiF52OAiRPgwSQpd/AbOuGjDef1OLsMTUzi0jazHqY2rBrmioGMoMlEzQUyGaIuT
 cDPeRdJ8XDmaK1pH5VY4aKbKVmg+dpa3AC98b/nKBz1i02S/sLxE8PW9xsUDzds1UaE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L9ndETiZ6ydBIdtdPhUq29jf2zBhpAg9bXwFoPQZIro=; b=XzKaWv5bVQOcC448jnP+KuDgrg
 w5UVf2D/DA/9eW/4j9/QIBMQQJPAYtUHQcLgCMrFl7A8frrFzBq0IFJmAsxG/cNK7THIb1FgMHw5i
 cZ5EyMtgbPToFz5lKrnBokOgmbw3XRR4z1jehvrbeiox3qFMfaICAA68yKPpkPHrisZI=;
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQlsd-004GbI-SC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 04:51:05 +0000
Received: by mail-qt1-f196.google.com with SMTP id k24so1817640qtq.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 May 2019 21:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L9ndETiZ6ydBIdtdPhUq29jf2zBhpAg9bXwFoPQZIro=;
 b=FJshx7i55u+PboSzaxAMwSb6VwtMXiyHtRxM2jpdXvoMaTDwVE4j5s5z7MtwUnl277
 3gdaAf5PM6pdA5KFOLL3Z3D3cbpI5WnxS4gdOtb81hC9TGBleQyjLl6V0a9r5KomUiuG
 5gA2Vn87drRRhy25M9rxTLvm5sTjDu0enRjjd92p+MzE9eC1cv6ulEZaRpeQISdx2R2+
 nL/0dgWo9KhyWtXbwhn4Np9AcEVod0LOX0vUDPT313OmjRmZos82zZVKTpC4VcRPaKoW
 9ykRPAY2CGa+3bplDYjWRfexLbT315S+wnt7Yoo12+36uFh+Fq3j+kRTYIQwzj+1lnV0
 DsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L9ndETiZ6ydBIdtdPhUq29jf2zBhpAg9bXwFoPQZIro=;
 b=YMiuONUiVCXjMUpx4te8J5dp4xt1poChpj82EQwm1VxKYz3QPmDJSoSXCkeFG552d/
 EwhRGSgSRX0tsiRCfm+n7vZhUz03Ow/eoCRfHzIPSsQmLIVlwuD9RSp6K4dSel1/IREW
 jr4RLFv+vvvE5jeDJgfpwRAwyW9LTuX+g2RG+Vy2oEj5qe+/jiAmPmP68cB1m4yM8E90
 EuGXvJdKYfr5D8mcwtZXfaehvEUZPwg+fY1qDXF37Ial7l1ZcPX9bIxgEhMFam1Va5Y2
 IbZz0lq7VdIMIrpOYFUlTcmSQXZrslycAknziWFP1zeHwlZSDiW8EzZdkMF6ExbKdxPA
 5zDQ==
X-Gm-Message-State: APjAAAVA5XxtAMNFbk9gGE8nOE6ZFkTg1ozsfrZONSoJZmO/islH7LcD
 Ruk/YGzBAhweTIInIheYPXDgP9yJMHYLUeNGEyE=
X-Google-Smtp-Source: APXvYqwtHuIBgYXQ6BPGZykUroqVUE8i0GGl6KL56ta/TQisWwJf5t4X2m4XCtk2dbcWCt8NuKtZwKip4eziFFo+No4=
X-Received: by 2002:a0c:fdc7:: with SMTP id g7mr30888054qvs.230.1557895857675; 
 Tue, 14 May 2019 21:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190514093340.40217-1-yuchao0@huawei.com>
 <20190514093340.40217-2-yuchao0@huawei.com>
 <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
In-Reply-To: <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Wed, 15 May 2019 13:50:46 +0900
Message-ID: <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.196 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hQlsd-004GbI-SC
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

The new logs are at
http://arter97.com/f2fs/v3

The first run spits out 60MB worth of log
and the second run spits out 170MB worth of log
and the third run now returns everything's ok.

Returning ok after 2nd run is good news, but the user would expect
everything to be fixed with just the first run of fsck'ing. Is this
expected?

I'll test the new kernel soon.

Thanks.

On Tue, May 14, 2019 at 6:54 PM Ju Hyung Park <qkrwngud825@gmail.com> wrote:
>
> Ah, sorry. I typed too soon.
>
> I'll make sure to test this sooner than later.
> Sorry for the delay.
>
> Thanks :)
>
> On Tue, May 14, 2019, 6:43 PM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> Hi Ju Hyung,
>>
>> This is the change on tools part. ;)
>>
>> Thanks,
>>
>> On 2019/5/14 17:38, Ju Hyung Park wrote:
>> > Hi Chao,
>> >
>> > I believe Jaegeuk already queued v2 for Linus, I think you should probably
>> > make this as a separate patch.
>> >
>> > Thanks.
>> >
>> > On Tue, May 14, 2019, 6:35 PM Chao Yu <yuchao0@huawei.com> wrote:
>> >
>> >> For large_nat_bitmap feature, there is a design flaw:
>> >>
>> >> Previous:
>> >>
>> >> struct f2fs_checkpoint layout:
>> >> +--------------------------+  0x0000
>> >> | checkpoint_ver           |
>> >> | ......                   |
>> >> | checksum_offset          |------+
>> >> | ......                   |      |
>> >> | sit_nat_version_bitmap[] |<-----|-------+
>> >> | ......                   |      |       |
>> >> | checksum_value           |<-----+       |
>> >> +--------------------------+  0x1000      |
>> >> |                          |      nat_bitmap + sit_bitmap
>> >> | payload blocks           |              |
>> >> |                          |              |
>> >> +--------------------------|<-------------+
>> >>
>> >> Obviously, if nat_bitmap size + sit_bitmap size is larger than
>> >> MAX_BITMAP_SIZE_IN_CKPT, nat_bitmap or sit_bitmap may overlap
>> >> checkpoint checksum's position, once checkpoint() is triggered
>> >> from kernel, nat or sit bitmap will be damaged by checksum field.
>> >>
>> >> In order to fix this, let's relocate checksum_value's position
>> >> to the head of sit_nat_version_bitmap as below, then nat/sit
>> >> bitmap and chksum value update will become safe.
>> >>
>> >> After:
>> >>
>> >> struct f2fs_checkpoint layout:
>> >> +--------------------------+  0x0000
>> >> | checkpoint_ver           |
>> >> | ......                   |
>> >> | checksum_offset          |------+
>> >> | ......                   |      |
>> >> | sit_nat_version_bitmap[] |<-----+
>> >> | ......                   |<-------------+
>> >> |                          |              |
>> >> +--------------------------+  0x1000      |
>> >> |                          |      nat_bitmap + sit_bitmap
>> >> | payload blocks           |              |
>> >> |                          |              |
>> >> +--------------------------|<-------------+
>> >>
>> >> Related report and discussion:
>> >>
>> >> https://sourceforge.net/p/linux-f2fs/mailman/message/36642346/
>> >>
>> >> In addition, during writing checkpoint, if large_nat_bitmap feature is
>> >> enabled, we need to set CP_LARGE_NAT_BITMAP_FLAG flag in checkpoint.
>> >>
>> >> Reported-by: Park Ju Hyung <qkrwngud825@gmail.com>
>> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> >> ---
>> >> v3:
>> >> - if large_nat_bitmap is off, fix to configure checksum_offset to
>> >> CP_CHKSUM_OFFSET.
>> >>  fsck/f2fs.h        |  9 ++++++++-
>> >>  fsck/fsck.c        | 37 +++++++++++++++++++++++++++++++++++++
>> >>  fsck/fsck.h        |  1 +
>> >>  fsck/main.c        |  2 ++
>> >>  fsck/mount.c       |  9 ++++++++-
>> >>  fsck/resize.c      |  5 +++++
>> >>  include/f2fs_fs.h  | 10 ++++++++--
>> >>  mkfs/f2fs_format.c |  5 ++++-
>> >>  8 files changed, 73 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
>> >> index 93f01e5..4dc6698 100644
>> >> --- a/fsck/f2fs.h
>> >> +++ b/fsck/f2fs.h
>> >> @@ -270,9 +270,16 @@ static inline void *__bitmap_ptr(struct f2fs_sb_info
>> >> *sbi, int flag)
>> >>         int offset;
>> >>
>> >>         if (is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG)) {
>> >> +               unsigned int chksum_size = 0;
>> >> +
>> >>                 offset = (flag == SIT_BITMAP) ?
>> >>                         le32_to_cpu(ckpt->nat_ver_bitmap_bytesize) : 0;
>> >> -               return &ckpt->sit_nat_version_bitmap + offset;
>> >> +
>> >> +               if (le32_to_cpu(ckpt->checksum_offset) ==
>> >> +                                       CP_MIN_CHKSUM_OFFSET)
>> >> +                       chksum_size = sizeof(__le32);
>> >> +
>> >> +               return &ckpt->sit_nat_version_bitmap + offset +
>> >> chksum_size;
>> >>         }
>> >>
>> >>         if (le32_to_cpu(F2FS_RAW_SUPER(sbi)->cp_payload) > 0) {
>> >> diff --git a/fsck/fsck.c b/fsck/fsck.c
>> >> index a8c8923..b5daeb4 100644
>> >> --- a/fsck/fsck.c
>> >> +++ b/fsck/fsck.c
>> >> @@ -1917,6 +1917,19 @@ int fsck_chk_meta(struct f2fs_sb_info *sbi)
>> >>         return 0;
>> >>  }
>> >>
>> >> +void fsck_chk_checkpoint(struct f2fs_sb_info *sbi)
>> >> +{
>> >> +       struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
>> >> +
>> >> +       if (get_cp(ckpt_flags) & CP_LARGE_NAT_BITMAP_FLAG) {
>> >> +               if (get_cp(checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
>> >> +                       ASSERT_MSG("Deprecated layout of large_nat_bitmap,
>> >> "
>> >> +                               "chksum_offset:%u",
>> >> get_cp(checksum_offset));
>> >> +                       c.fix_chksum = 1;
>> >> +               }
>> >> +       }
>> >> +}
>> >> +
>> >>  void fsck_init(struct f2fs_sb_info *sbi)
>> >>  {
>> >>         struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
>> >> @@ -2017,6 +2030,23 @@ static void flush_curseg_sit_entries(struct
>> >> f2fs_sb_info *sbi)
>> >>         free(sit_blk);
>> >>  }
>> >>
>> >> +static void fix_checksum(struct f2fs_sb_info *sbi)
>> >> +{
>> >> +       struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
>> >> +       struct f2fs_nm_info *nm_i = NM_I(sbi);
>> >> +       struct sit_info *sit_i = SIT_I(sbi);
>> >> +       void *bitmap_offset;
>> >> +
>> >> +       if (!c.fix_chksum)
>> >> +               return;
>> >> +
>> >> +       bitmap_offset = cp->sit_nat_version_bitmap + sizeof(__le32);
>> >> +
>> >> +       memcpy(bitmap_offset, nm_i->nat_bitmap, nm_i->bitmap_size);
>> >> +       memcpy(bitmap_offset + nm_i->bitmap_size,
>> >> +                       sit_i->sit_bitmap, sit_i->bitmap_size);
>> >> +}
>> >> +
>> >>  static void fix_checkpoint(struct f2fs_sb_info *sbi)
>> >>  {
>> >>         struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
>> >> @@ -2038,6 +2068,12 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>> >>                 flags |= CP_TRIMMED_FLAG;
>> >>         if (is_set_ckpt_flags(cp, CP_DISABLED_FLAG))
>> >>                 flags |= CP_DISABLED_FLAG;
>> >> +       if (is_set_ckpt_flags(cp, CP_LARGE_NAT_BITMAP_FLAG)) {
>> >> +               flags |= CP_LARGE_NAT_BITMAP_FLAG;
>> >> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>> >> +       } else {
>> >> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>> >> +       }
>> >>
>> >>         if (flags & CP_UMOUNT_FLAG)
>> >>                 cp_blocks = 8;
>> >> @@ -2717,6 +2753,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>> >>                                 write_curseg_info(sbi);
>> >>                                 flush_curseg_sit_entries(sbi);
>> >>                         }
>> >> +                       fix_checksum(sbi);
>> >>                         fix_checkpoint(sbi);
>> >>                 } else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
>> >>                         is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
>> >> diff --git a/fsck/fsck.h b/fsck/fsck.h
>> >> index cbd6e93..c8802b0 100644
>> >> --- a/fsck/fsck.h
>> >> +++ b/fsck/fsck.h
>> >> @@ -154,6 +154,7 @@ extern int fsck_chk_dentry_blk(struct f2fs_sb_info *,
>> >> u32, struct child_info *,
>> >>                 int, int);
>> >>  int fsck_chk_inline_dentries(struct f2fs_sb_info *, struct f2fs_node *,
>> >>                 struct child_info *);
>> >> +void fsck_chk_checkpoint(struct f2fs_sb_info *sbi);
>> >>  int fsck_chk_meta(struct f2fs_sb_info *sbi);
>> >>  int fsck_chk_curseg_info(struct f2fs_sb_info *);
>> >>  int convert_encrypted_name(unsigned char *, u32, unsigned char *, int);
>> >> diff --git a/fsck/main.c b/fsck/main.c
>> >> index 03076d9..afdfec9 100644
>> >> --- a/fsck/main.c
>> >> +++ b/fsck/main.c
>> >> @@ -616,6 +616,8 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>> >>                 c.fix_on = 1;
>> >>         }
>> >>
>> >> +       fsck_chk_checkpoint(sbi);
>> >> +
>> >>         fsck_chk_quota_node(sbi);
>> >>
>> >>         /* Traverse all block recursively from root inode */
>> >> diff --git a/fsck/mount.c b/fsck/mount.c
>> >> index 95c5357..5a0955e 100644
>> >> --- a/fsck/mount.c
>> >> +++ b/fsck/mount.c
>> >> @@ -774,7 +774,8 @@ static int verify_checksum_chksum(struct
>> >> f2fs_checkpoint *cp)
>> >>         unsigned int chksum_offset = get_cp(checksum_offset);
>> >>         unsigned int crc, cal_crc;
>> >>
>> >> -       if (chksum_offset > CP_CHKSUM_OFFSET) {
>> >> +       if (chksum_offset < CP_MIN_CHKSUM_OFFSET ||
>> >> +                       chksum_offset > CP_CHKSUM_OFFSET) {
>> >>                 MSG(0, "\tInvalid CP CRC offset: %u\n", chksum_offset);
>> >>                 return -1;
>> >>         }
>> >> @@ -2372,6 +2373,12 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>> >>                 flags |= CP_TRIMMED_FLAG;
>> >>         if (is_set_ckpt_flags(cp, CP_DISABLED_FLAG))
>> >>                 flags |= CP_DISABLED_FLAG;
>> >> +       if (is_set_ckpt_flags(cp, CP_LARGE_NAT_BITMAP_FLAG)) {
>> >> +               flags |= CP_LARGE_NAT_BITMAP_FLAG;
>> >> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>> >> +       } else {
>> >> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>> >> +       }
>> >>
>> >>         set_cp(free_segment_count, get_free_segments(sbi));
>> >>         set_cp(valid_block_count, sbi->total_valid_block_count);
>> >> diff --git a/fsck/resize.c b/fsck/resize.c
>> >> index 5537a73..fc563f2 100644
>> >> --- a/fsck/resize.c
>> >> +++ b/fsck/resize.c
>> >> @@ -514,6 +514,11 @@ static void rebuild_checkpoint(struct f2fs_sb_info
>> >> *sbi,
>> >>         flags = update_nat_bits_flags(new_sb, cp, get_cp(ckpt_flags));
>> >>         if (flags & CP_COMPACT_SUM_FLAG)
>> >>                 flags &= ~CP_COMPACT_SUM_FLAG;
>> >> +       if (flags & CP_LARGE_NAT_BITMAP_FLAG)
>> >> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>> >> +       else
>> >> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>> >> +
>> >>         set_cp(ckpt_flags, flags);
>> >>
>> >>         memcpy(new_cp, cp, (unsigned char *)cp->sit_nat_version_bitmap -
>> >> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
>> >> index e0a4cbf..84a4e55 100644
>> >> --- a/include/f2fs_fs.h
>> >> +++ b/include/f2fs_fs.h
>> >> @@ -382,6 +382,7 @@ struct f2fs_configuration {
>> >>         int ro;
>> >>         int preserve_limits;            /* preserve quota limits */
>> >>         int large_nat_bitmap;
>> >> +       int fix_chksum;                 /* fix old cp.chksum position */
>> >>         __le32 feature;                 /* defined features */
>> >>
>> >>         /* mkfs parameters */
>> >> @@ -692,10 +693,15 @@ struct f2fs_checkpoint {
>> >>         unsigned char sit_nat_version_bitmap[1];
>> >>  } __attribute__((packed));
>> >>
>> >> +#define CP_BITMAP_OFFSET       \
>> >> +       (offsetof(struct f2fs_checkpoint, sit_nat_version_bitmap))
>> >> +#define CP_MIN_CHKSUM_OFFSET   CP_BITMAP_OFFSET
>> >> +
>> >> +#define MIN_NAT_BITMAP_SIZE    64
>> >>  #define MAX_SIT_BITMAP_SIZE_IN_CKPT    \
>> >> -       (CP_CHKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1 - 64)
>> >> +       (CP_CHKSUM_OFFSET - CP_BITMAP_OFFSET - MIN_NAT_BITMAP_SIZE)
>> >>  #define MAX_BITMAP_SIZE_IN_CKPT        \
>> >> -       (CP_CHKSUM_OFFSET - sizeof(struct f2fs_checkpoint) + 1)
>> >> +       (CP_CHKSUM_OFFSET - CP_BITMAP_OFFSET)
>> >>
>> >>  /*
>> >>   * For orphan inode management
>> >> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>> >> index ab8103c..ed27700 100644
>> >> --- a/mkfs/f2fs_format.c
>> >> +++ b/mkfs/f2fs_format.c
>> >> @@ -690,7 +690,10 @@ static int f2fs_write_check_point_pack(void)
>> >>         set_cp(nat_ver_bitmap_bytesize, ((get_sb(segment_count_nat) / 2) <<
>> >>                          get_sb(log_blocks_per_seg)) / 8);
>> >>
>> >> -       set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>> >> +       if (c.large_nat_bitmap)
>> >> +               set_cp(checksum_offset, CP_MIN_CHKSUM_OFFSET);
>> >> +       else
>> >> +               set_cp(checksum_offset, CP_CHKSUM_OFFSET);
>> >>
>> >>         crc = f2fs_checkpoint_chksum(cp);
>> >>         *((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
>> >> --
>> >> 2.18.0.rc1
>> >>
>> >>
>> >>
>> >> _______________________________________________
>> >> Linux-f2fs-devel mailing list
>> >> Linux-f2fs-devel@lists.sourceforge.net
>> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>> >>
>> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

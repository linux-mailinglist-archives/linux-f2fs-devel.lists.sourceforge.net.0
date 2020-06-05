Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7641F01D6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 23:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXgba3aQECQD/ib9fCMHVmvfho4sfgEFhVZeF+a8ki8=; b=Vfw2YoVSqh/dt4KHmaaK73pItr
	0KgQtE12FaD66QRSGURYXFboxXzshmfn5DlcDGOnajmkq+V7DhYOsaPkyT5UpY7rNJkXMSfvi9QGo
	93FbDymbYr5i6JguXPjBpS9SKBzBpN3b9CuZFzKigwjRzXJOUvlehHyzFCjeKdRlRAZE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jhK1C-0002GW-EN; Fri, 05 Jun 2020 21:36:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ndesaulniers@google.com>) id 1jhK1B-0002GI-2Y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 21:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+CPlFvNq/YrKeB3Ps3Y0hn9p5nUQHpZCR2F66xpo1f4=; b=RNXLxITJbzkguZ7U+AP1Y09qp6
 1xE4mmnA7vmit6LQGV7Rak/QnjI7vZOEp/3cEmWYvSgZeLX8CQb5Zc0kA9umSAfB6gcgclPpDt3Pi
 jvxGyttUOIASaTEpvnTmty0IMyrhA2p/XGKdjPvIAIo7kJo2WnxIWTklYVciLXdefoyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+CPlFvNq/YrKeB3Ps3Y0hn9p5nUQHpZCR2F66xpo1f4=; b=Raix5E+YB+ZxqHys9BRsJv1iap
 eZJ+fzHQuLVI8u94yGnkzWSPKdlPdufzjP2MBcnG3NCFH7JhE9bZNABk4eVv1Tu0eFZ9NHNzaHdwi
 pPhFfFexZR5rSwfeq/seAAEbhHDh2B8UTmZhUXOruNyi95nawjhht7rMUdtVhbmkcQkA=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhK17-007YwH-4C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 21:36:49 +0000
Received: by mail-pg1-f169.google.com with SMTP id m1so5813518pgk.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Jun 2020 14:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+CPlFvNq/YrKeB3Ps3Y0hn9p5nUQHpZCR2F66xpo1f4=;
 b=orKrtezCBksodek6XJh2w6Dk0H5voOgw6OJBGyH3KQxMC6Obw/mcYlxsOJmtY5LCVu
 LlhyT2vi3DuCv3ucOaPxIYerBfnqlBSS3Wm/5vF82ppHj31V9JVjhsr4pJ1i5nwya6Wn
 yESXnLVlPh3FE2/6N4RJ68HInD1vXC6vaoUIq3MecGn5slG2ZHZ0tf05tE/MQopHr0Lw
 bCmsRQq7+SNori/NYtmcc2u2Wr6lrWHjuQtIN8xsxOP17Kc1ckTkRCDIgzOTKcprOalc
 4rcNKVMvo/CkSFtAN5YJDjnWN34muckwQLvXbBuxM31NX4q5CuuueKFhdH11zX+4ZuVu
 9Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CPlFvNq/YrKeB3Ps3Y0hn9p5nUQHpZCR2F66xpo1f4=;
 b=HK4IALd3Inkes9jXsJUPtDUKXpg99cKjQ4hpPVcqe/re2XOmV7EoviY9OxlYpNX25V
 p7eJz5ijRof5fbudTeN+Pd+mWKS5imjQDEI6Eue2YJiQEhyvKR+pjMm0b+4la5ZRmu8K
 tF/+dtyfiP47kw249uUOYcSae64aWG8LnHK3O2DDlArRXLbfIufRuchAVJSxO8rUSxYH
 hASxU5rNPhZJRyAS9yVL/IUFoBbzgX78+MrdrLTbVUCo73+REF7EKkqYhpvq+47ukrw6
 51pzvmfFh1CfjmO++oJDXcnd+Fq19ukMDpxVpUfVeHbGtJxpu9AIpPekYc5uqjGMuMok
 WkmA==
X-Gm-Message-State: AOAM531Mv99dLvFiw1d6M06PvZg0XF1H+/QwTZnFsIsWDvpZ9vh8fSZy
 FCV15Ipk6Cg/1GQfpdFlig5xWv8atcj/X5Oi7kpkgD+dupo=
X-Google-Smtp-Source: ABdhPJyKB1TltvDygDL3PUAsE23KowC77IbnW/+7/3TWxe0RJXajOg7LS5IBDYB3N7XD4Muv7iNINvVPuAlnuWiDzlA=
X-Received: by 2002:a17:902:341:: with SMTP id
 59mr11022457pld.119.1591392535271; 
 Fri, 05 Jun 2020 14:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <202006051725.63EW72i7%lkp@intel.com>
 <20200605145546.GA227721@google.com>
 <20200605160830.GB1373@sol.localdomain>
 <CAKwvOdm1Ew1dBVcmxDHtKWp383Dsrxjhaweek=-LDomfKnj7Qg@mail.gmail.com>
 <20200605193359.GK1373@sol.localdomain>
 <CAKwvOdmE_59v6-W+Sk8SGrrXJ4dx5ANWEpD5GL_hrw0ja0w1kg@mail.gmail.com>
 <20200605195713.GL1373@sol.localdomain>
 <CAKwvOdm_EfEuhb8QVNzbFhVnTN+q5tkDkWPxOpC+rfzOVxpWVg@mail.gmail.com>
 <20200605203340.GM1373@sol.localdomain>
In-Reply-To: <20200605203340.GM1373@sol.localdomain>
Date: Fri, 5 Jun 2020 14:28:44 -0700
Message-ID: <CAKwvOdn-s5n-z1vnh_Mt4+WHsb9oZSVpNxe33ZuMPiY0=wcECw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhK17-007YwH-4C
Subject: Re: [f2fs-dev] [f2fs:dev-test 48/48] fs/f2fs/super.c:3303:12:
 warning: stack frame size of 2064 bytes in function 'f2fs_fill_super'
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
From: Nick Desaulniers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 5, 2020 at 1:33 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 05, 2020 at 01:02:54PM -0700, Nick Desaulniers wrote:
> > Right, so my script would have printed out the list of all local
> > variables in f2fs_fill_super() and their sizes.  With that information
> > handy, we could assess if there were any smoking guns of clearly
> > incorrect large stack allocations vs death by a thousand cuts.  Your
> > change may not have added a new large local allocation, simply tipped
> > the scale or changed inlining decisions.  They may be other local
> > variables in this call chain that we should reassess allocation
> > strategy; ie. dynamic or static rather than local, to avoid the
> > potential for exhausting kernel stack.
>
> For comparison, I also tried building for x86_64 (with gcc 10.1.0) and running
> your script.  But it crashed:
>
> f2fs_fill_super:
>         8       struct f2fs_sb_info*    sbi
>         8       struct f2fs_super_block*        raw_super
>         8       struct inode*           root
>         4       int                     err
> Unsupported type info for bool, implement me!
> DIE DW_TAG_typedef, size=12, has_children=False
>     |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'bool', raw_value=2068, offset=691)
>     |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=695)
>     |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=30, raw_value=30, offset=696)
>     |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=17, raw_value=17, offset=697)
>     |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=702, raw_value=702, offset=698)

Thanks for the report, I've added support for parsing DW_TAG_typedef
tags, and...

>
>         0       None                    skip_recovery
> Unsupported type info for bool, implement me!
> DIE DW_TAG_typedef, size=12, has_children=False
>     |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'bool', raw_value=2068, offset=691)
>     |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=695)
>     |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=30, raw_value=30, offset=696)
>     |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=17, raw_value=17, offset=697)
>     |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=702, raw_value=702, offset=698)
>
>         0       None                    need_fsck
>         8       char*                   options
>         4       int                     recovery
>         4       int                     i
>         4       int                     valid_super_block
>         8       struct curseg_info*     seg_i
>         4       int                     retry_cnt
>         0       struct lock_class_key   __key
>         0       struct lock_class_key   __key
>         0       struct lock_class_key   __key
>         0       struct lock_class_key   __key
>         0       struct lock_class_key   __key
>         4       int                     n
>         4       int                     j
>         0       struct lock_class_key   __key
>         0       struct lock_class_key   __key
> array_size:
> Unsupported type info for size_t, implement me!
> DIE DW_TAG_typedef, size=12, has_children=False
>     |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
>     |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
>     |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
>     |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
>     |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)
>
>         0       None                    bytes
> Unsupported type info for size_t, implement me!
> DIE DW_TAG_typedef, size=12, has_children=False
>     |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
>     |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
>     |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
>     |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
>     |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)
>
>         0       None                    __a
> Unsupported type info for size_t, implement me!
> DIE DW_TAG_typedef, size=12, has_children=False
>     |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
>     |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
>     |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
>     |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
>     |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)
>
>         0       None                    __b
> Unsupported type info for size_t, implement me!
> DIE DW_TAG_typedef, size=12, has_children=False
>     |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
>     |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
>     |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
>     |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
>     |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)
>
> Traceback (most recent call last):
>   File "/home/e/src/frame-larger-than/frame_larger_than.py", line 147, in <module>
>     parse_file(elffile.get_dwarf_info(), sys.argv[2])
>   File "/home/e/src/frame-larger-than/frame_larger_than.py", line 129, in parse_file
>     parse_file(dwarf_info, get_name(ti))
>   File "/home/e/src/frame-larger-than/frame_larger_than.py", line 125, in parse_file
>     print_var(dwarf_info, DIE)
>   File "/home/e/src/frame-larger-than/frame_larger_than.py", line 111, in print_var
>     type_string = get_type_string(dwarf_info, type_info)
>   File "/home/e/src/frame-larger-than/frame_larger_than.py", line 85, in get_type_string
>     return get_type_string(dwarf_info, pointed_to_type) + '*'
> TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'
>

looks like broken debug info was generated, a DW_TAG_const_type tag
with no base type.  As if you typed `const x = 10;` in C where `x` was
not a typedef, but an identifier.  I added a workaround, and should
investigate and report to GCC that broken debug info was generated.
If you pull the latest version and rerun it shouldn't crash for that
input.

-- 
Thanks,
~Nick Desaulniers


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

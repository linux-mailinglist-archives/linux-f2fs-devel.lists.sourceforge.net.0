Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1321F00FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 22:33:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jhJ2G-0001T3-81; Fri, 05 Jun 2020 20:33:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jhJ2F-0001Sr-6z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 20:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ix1J8NLrpSSgGJ4ufhEE9TtaPtd2SB707woEm0ca3WU=; b=EczOiCy3GWDqIey7p8T4AA0l++
 /sIxkFniR8ptwqAZ0wQs1/Ts5h1jICIIixiJk3gTGorcfxrUmRzyN0gQEVl7zvZnKR60oVuS0UqFV
 cMXG/ffRz9Vat6Nf/PDb8ZEzsejf+Qs9yqYmHMslOtIldIfMNFTobpisZRbTaaYkg+rY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ix1J8NLrpSSgGJ4ufhEE9TtaPtd2SB707woEm0ca3WU=; b=T2faziPuVqvq+SJ4kJKsHORQEb
 H9oDjD7oY2N9u9euTwgqDn2wNEAMkbaoFOGy8vJj6CGKFbFX3fT29KwU9vZrO1jwqUve5WPZIS6+k
 +SKEdi4WLRBh4YEyojJHCxjjB7Ha1KJkBrKLxqD3cj0cbgHFDVf5sF/1OdN5eL9Dw9NE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jhJ2C-00AMXE-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 20:33:51 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 849FA207D0;
 Fri,  5 Jun 2020 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591389221;
 bh=FIZVsjv4ztvr+Je+9fQSuPW0/v4553ruZ7AiLUdh5IY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wgNqu9kcUDS9pIO7Gfy8r2rH8YDS1ig6RnEKFV30m4VCKinuhEdjapr1P8L4FkPOu
 ZwKTgwXOtliLDT8E8fCcJlnCKDpfwOVNsI17ZAkM6EMeHxE5jpWNETMu3Bdl4Lt3eJ
 rlm4gp0DdSa7o2Swg1u9bNnf7pM/TN21Z6C0ALC0=
Date: Fri, 5 Jun 2020 13:33:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20200605203340.GM1373@sol.localdomain>
References: <202006051725.63EW72i7%lkp@intel.com>
 <20200605145546.GA227721@google.com>
 <20200605160830.GB1373@sol.localdomain>
 <CAKwvOdm1Ew1dBVcmxDHtKWp383Dsrxjhaweek=-LDomfKnj7Qg@mail.gmail.com>
 <20200605193359.GK1373@sol.localdomain>
 <CAKwvOdmE_59v6-W+Sk8SGrrXJ4dx5ANWEpD5GL_hrw0ja0w1kg@mail.gmail.com>
 <20200605195713.GL1373@sol.localdomain>
 <CAKwvOdm_EfEuhb8QVNzbFhVnTN+q5tkDkWPxOpC+rfzOVxpWVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdm_EfEuhb8QVNzbFhVnTN+q5tkDkWPxOpC+rfzOVxpWVg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhJ2C-00AMXE-Qi
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 05, 2020 at 01:02:54PM -0700, Nick Desaulniers wrote:
> Right, so my script would have printed out the list of all local
> variables in f2fs_fill_super() and their sizes.  With that information
> handy, we could assess if there were any smoking guns of clearly
> incorrect large stack allocations vs death by a thousand cuts.  Your
> change may not have added a new large local allocation, simply tipped
> the scale or changed inlining decisions.  They may be other local
> variables in this call chain that we should reassess allocation
> strategy; ie. dynamic or static rather than local, to avoid the
> potential for exhausting kernel stack.

For comparison, I also tried building for x86_64 (with gcc 10.1.0) and running
your script.  But it crashed:

f2fs_fill_super:
	8	struct f2fs_sb_info*	sbi
	8	struct f2fs_super_block*	raw_super
	8	struct inode*       	root
	4	int                 	err
Unsupported type info for bool, implement me!
DIE DW_TAG_typedef, size=12, has_children=False
    |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'bool', raw_value=2068, offset=691)
    |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=695)
    |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=30, raw_value=30, offset=696)
    |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=17, raw_value=17, offset=697)
    |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=702, raw_value=702, offset=698)

	0	None                	skip_recovery
Unsupported type info for bool, implement me!
DIE DW_TAG_typedef, size=12, has_children=False
    |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'bool', raw_value=2068, offset=691)
    |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=695)
    |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=30, raw_value=30, offset=696)
    |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=17, raw_value=17, offset=697)
    |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=702, raw_value=702, offset=698)

	0	None                	need_fsck
	8	char*               	options
	4	int                 	recovery
	4	int                 	i
	4	int                 	valid_super_block
	8	struct curseg_info* 	seg_i
	4	int                 	retry_cnt
	0	struct lock_class_key	__key
	0	struct lock_class_key	__key
	0	struct lock_class_key	__key
	0	struct lock_class_key	__key
	0	struct lock_class_key	__key
	4	int                 	n
	4	int                 	j
	0	struct lock_class_key	__key
	0	struct lock_class_key	__key
array_size:
Unsupported type info for size_t, implement me!
DIE DW_TAG_typedef, size=12, has_children=False
    |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
    |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
    |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
    |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
    |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)

	0	None                	bytes
Unsupported type info for size_t, implement me!
DIE DW_TAG_typedef, size=12, has_children=False
    |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
    |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
    |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
    |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
    |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)

	0	None                	__a
Unsupported type info for size_t, implement me!
DIE DW_TAG_typedef, size=12, has_children=False
    |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
    |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
    |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
    |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
    |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)

	0	None                	__b
Unsupported type info for size_t, implement me!
DIE DW_TAG_typedef, size=12, has_children=False
    |DW_AT_name        :  AttributeValue(name='DW_AT_name', form='DW_FORM_strp', value=b'size_t', raw_value=1942, offset=746)
    |DW_AT_decl_file   :  AttributeValue(name='DW_AT_decl_file', form='DW_FORM_data1', value=36, raw_value=36, offset=750)
    |DW_AT_decl_line   :  AttributeValue(name='DW_AT_decl_line', form='DW_FORM_data1', value=55, raw_value=55, offset=751)
    |DW_AT_decl_column :  AttributeValue(name='DW_AT_decl_column', form='DW_FORM_data1', value=26, raw_value=26, offset=752)
    |DW_AT_type        :  AttributeValue(name='DW_AT_type', form='DW_FORM_ref4', value=441, raw_value=441, offset=753)

Traceback (most recent call last):
  File "/home/e/src/frame-larger-than/frame_larger_than.py", line 147, in <module>
    parse_file(elffile.get_dwarf_info(), sys.argv[2])
  File "/home/e/src/frame-larger-than/frame_larger_than.py", line 129, in parse_file
    parse_file(dwarf_info, get_name(ti))
  File "/home/e/src/frame-larger-than/frame_larger_than.py", line 125, in parse_file
    print_var(dwarf_info, DIE)
  File "/home/e/src/frame-larger-than/frame_larger_than.py", line 111, in print_var
    type_string = get_type_string(dwarf_info, type_info)
  File "/home/e/src/frame-larger-than/frame_larger_than.py", line 85, in get_type_string
    return get_type_string(dwarf_info, pointed_to_type) + '*'
TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

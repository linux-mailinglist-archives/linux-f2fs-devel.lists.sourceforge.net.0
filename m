Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E36DB27F26
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 13:28:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHoxl0IrrK2txD05/WXB8xECb/GbGzSbv+w/uubVrVU=; b=MWQa4m14K9xJp64Otku0wVNdKZ
	MDhDj/MlRSDp0C88RUX0iNcePAWxYMe039dmjdr+x40uRaYIwly635KBMaLSYK9SNkEK1hT0GojH+
	vulzcwegVvPz0KE/m6wvaIi+//iq1Uhs0N00yvSvhnuNjV4KmlFReZLKjLGsND8+CoZM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umsbM-0002t9-Mx;
	Fri, 15 Aug 2025 11:28:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong2021@gmail.com>) id 1umsbA-0002sm-Tf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 11:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ddx2FS/JuiCnmiKHK7xTxsaXL7oIwGJVpd7tpx6DhU=; b=KaKE0gKr5DVlEmJRH657iuwPbr
 tPQoQQtdGKD0PPLcilcgo2QMEd/zQw418auLIIy2aAWadbuNBtAw5vzRJwHC5ofYjykExlPl7V44u
 LDxc2hbaKYGfR9mzrafZC85dCmnBKcH+zcljC0DDhghjQQbO6ioURjJ8Vpd7WKML7f7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ddx2FS/JuiCnmiKHK7xTxsaXL7oIwGJVpd7tpx6DhU=; b=gaBwy3gMYOcJu4S/VcavsYuTVw
 Aa9xcxcSTEwQ6FgrrHxDq3kIj2VPxPyRjkBGuz0P0NAPDX3DmyL3S1YhGCB0yMgm43iEllt/T06iQ
 X/jrpKW8eRXO6HqHhbkq6Al9Qjfu6bvqv+/ewG5zs8FTr1ivZh2aTg8fHtIFs41wYLXk=;
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1umsbA-0001wl-2l for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 11:27:52 +0000
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b471756592cso1275186a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755257266; x=1755862066; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ddx2FS/JuiCnmiKHK7xTxsaXL7oIwGJVpd7tpx6DhU=;
 b=FHeGSPZxS+jDe36cqcipDgpuTZYK9y+4CqK/F9gDJpg9Lasd5N8Wl9h2mhK1Lhtpat
 zGxoRHUHUJI0opIZwkmoq1WVDviLHW6926rSKGKzvRwdt0f0zbFKvfGgH82ZeuzkoAjW
 dbZhqktF0b9XX8kGPczmR3W32Db7HLw1jO1wGloKvYsq/+qyAPM7uf7/kHkfe56CJaE/
 OWTWyi0MImzZatI2hbTDxfvMdr+munYwVJCqbEiFEFsHDxmTzqTu0jhbRtLJ0XaxOkEy
 XNWy+jzFTqFh42IBZ8N57cEhF6VXoseNSs4pc8CCuPfP+UVkjqubd065EtQE9jtwZPHt
 WrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755257266; x=1755862066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:cc:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ddx2FS/JuiCnmiKHK7xTxsaXL7oIwGJVpd7tpx6DhU=;
 b=DsAZ2PQATKnbqWs0SrOGlFYS2Rb6F3t4gqJsQ5ioOTHECS85eD41yWAHmkmkilT7uu
 9e0MliouUbNNwVAhf1fVcqheVWOCjxN8AWsjUXK/nGQn/MpwKrJG8qRENT1XFFc45wsq
 gMMf+rnaSHvPoTUodihuXhQnHVIj2d7e/t08CRTsMaLwISM2SHkwUHjzR7HbWHU+9LsG
 5sHSMIao65X2vUg+/qiRoxyD/h+RBWF6UEO004eQBgF/LCKflmqZQo0El46vE1imRqyF
 3BSU+NKTLLtY8AnzJobwwKuZkFHFPTo0mXPvHrf5da4QjyAuN6yeTTplLGL1u9Z1xGai
 g2bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5DzR9mmL80/Thu0SNE47yaR3vN4kXDw+9AFwnS4zy3Aq2QvbFbYuLVIi+WlwLlHBRj4gSEhMMmrGA0f5MQ96N@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzZbYKLDf14NC9OoT7J2aSqAlGnvCrB2zfYhaoLLzigvL4LxOku
 RZKu+uqGA0WJxlHN4ZXIo1/VYb/9dvDl8uJk39gK23lI8KptMVn9F+yj
X-Gm-Gg: ASbGnctHZczcsgvs5S/gFoSrffcVYhYZDLEDBccILZaSA4ZdfEtVWk7+h38F2G7ndAH
 sxhYngj5Udwxc+sMlaTeNH0q7koqq50Hty/1IgIV+DyYKTiv81zJM1xrNISLMi+2xdRNP62EFqp
 TIw1wZEYOALZe/re2yz9j6xK8dS9lnuZ/MYcJeioXfTlT+UaJeVTF8CBmngxm2YhCk4M102diyy
 VSasEKATiFdqMIoZJQe4sqUZliPaW5cCo0ScWnjnQNb77jvUbi6I0v0fV01uzTk7eEg+BKaRemM
 q7YMPzt8EpUfk+taM3yqlEclChXA/+d8KQvhYwj/F25QGeGmOB+I0SMqP8i5ZLYfa9KqvJru+3L
 ktYrcCFcg1nRiuml211T6Y8rIfh84Yz/Ttg==
X-Google-Smtp-Source: AGHT+IG+lLZ6+oFIhidphmkWEqPCTYUBq6u+uDlZ+WIdEV1BputfJDGbJrotbXdHnBgc5lVgwAHDAw==
X-Received: by 2002:a17:902:f68c:b0:240:79d5:8dd0 with SMTP id
 d9443c01a7336-2446d713ec4mr23336365ad.13.1755257266191; 
 Fri, 15 Aug 2025 04:27:46 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9d9a7sm12251435ad.23.2025.08.15.04.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 04:27:45 -0700 (PDT)
Message-ID: <e87b4e1c-f7b9-4aa4-94ce-2f805cefa5cb@gmail.com>
Date: Fri, 15 Aug 2025 19:27:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <7a49cf29-a721-450c-9bd1-c0a5de268ce1@kernel.org>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <7a49cf29-a721-450c-9bd1-c0a5de268ce1@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/15/25 18:38, Chao Yu wrote: > Yong, > > Could you please
 split this patchset to two, 1~13 and 14~32? and update > 1~13 first? I guess
 1~13 are almost clear to be merged. Hi, Chao, Sorry for the delay. I will
 split the patchset and send a new version ASAP. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: runtests.in] [URI: expect.in]
 [URI: makefile.am] [URI: expected.in] [URI: configure.ac]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [shengyong2021(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [shengyong2021(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1umsbA-0001wl-2l
Subject: Re: [f2fs-dev] [RFC PATCH v2 00/32] f2fs-tools: add testcases
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/15/25 18:38, Chao Yu wrote:
> Yong,
> 
> Could you please split this patchset to two, 1~13 and 14~32? and update
> 1~13 first? I guess 1~13 are almost clear to be merged.

Hi, Chao,

Sorry for the delay. I will split the patchset and send a new version ASAP.

Thanks,
shengyong
> 
> On 6/10/25 20:37, Sheng Yong wrote:
>> Hi, folks,
>>
>> This patchset tries to add an auto testsuit for f2fs-tools, including
>> fsck.f2fs, inject.f2fs for now.
>>
>> The patchset can splited into 3 parts:
>>    PATCH 1~9:   is a preparation for testcases. It fixes some errors in
>>                 fsck and inject, and do some cleanup and improvement for
>>                 f2fs-tools.
>>    PATCH 10~13: add new injection members
>>    PATCH 14~32: add testcases
>>
>> thanks,
>> shengyong
>>
>> -8<-
>>
>> The following is almost quoted from v1:
>>
>> The basic idea of these testcases are:
>>   1. create f2fs image
>>   2. corrupt the image by inject specific fields
>>   3. fsck fixes the image
>>   4. verify fsck output with expected message
>>
>> Some helper scripts are provided:
>>   * test_config.in: is used to derive basic configurations of all
>>                     testcases.
>>   * runtests.in: is used to derive `runtests' which is used to run
>>                  testcases.
>>   * filter.sed: removes unnecessary messages and cleanup arbitrary
>>                 values.
>>   * helpers: provides helper functions
>>
>> The usage of `runtests':
>>   * run all testcases:
>>       runtests
>>   * run one testcase:
>>       runtests <testcase directory path>
>>   * cleanup previous results:
>>       runtests clean
>>
>> To run the testcases on Android, only have to change settings in
>> test_config:
>>   * set path of $META and $DATA
>>   * set path of tools
>>   * push tests directory to an Android phone
>> NOTE TAHT: the testcases will format $META!!!
>>
>> Some testcase requires root permission to mount the image and create
>> files.
>>
>> Each testcase should have a sub-directory, where three files are needed:
>>   * README: describe information of the testcase
>>   * script: testcase itself
>>   * expect.in: is used to derive expected output message
>>
>> New files are generated in the testcase directory after test:
>>   * log: output in detail
>>   * expect: derived from expect.in
>>   * out: output that will be compared with expect
>>   * PASS: testcase is passed
>>   * FAIL: testcase is failed, in which differ of out and expect is saved
>>
>> The name of testcase directory has some optional prefix:
>>   * f_: fsck testcase
>>   * i_: inject testcase
>>   * m_: mkfs testcase
>> But there are only fsck and inject testcases for now.
>>
>> To run testcases, it's better to compile fsck.f2fs as statically linked
>> executable, or `make install' installs tools and libraries. Otherwise,
>> libtool compiles f2fs-tools in debug mode and create a wrapper script
>> to locate elf executable and libraries. However, dump.f2fs and
>> inject.f2fs cannot be used in the wrapper way.
>>
>> v2: * add some fix and cleanup
>>      * remove img.tar.gz from testcases
>>      * add testcases for injection
>>      * cleanup helpers script and simplify filter.sed and expected.in
>> v1: https://lore.kernel.org/linux-f2fs-devel/20241029120956.4186731-1-shengyong@oppo.com/
>>
>> Sheng Yong (32):
>>    fsck.f2fs: do not finish/reset zone if dry-run is true
>>    f2fs-tools: add option N to answer no for all questions
>>    f2fs-tools: cleanup {nid|segno}_in_journal
>>    fsck.f2fs: fix invalidate checkpoint
>>    dump.f2fs: print more info
>>    f2fs-tools: add and export lookup_sit_in_journal
>>    inject.f2fs: fix injecting sit/nat in journal
>>    inject.f2fs: fix injection on zoned device
>>    inject.f2fs: fix and cleanup parsing numeric options
>>    inject.f2fs: add members in inject_cp
>>    inject.f2fs: add member `feature' in inject_sb
>>    inject.f2fs: add members in inject_node
>>    inject.f2fs: add member `filename' in inject_dentry
>>    tests: prepare helper scripts for testcases
>>    tests: add fsck testcase of fixing bad super magic
>>    tests: add fsck testcase of fixing errors recorded in sb
>>    tests: add fsck testcase of fixing cp crc
>>    tests: add fsck testcase of fixing nat entry with invalid ino
>>    tests: add fsck testcase of fixing nat entry with invalid blkaddr
>>    tests: add fsck testcase of fixing sit entry type
>>    tests: add fsck testcase of fixing sit entry vblocks
>>    tests: add fsck testcase of fixing sit entry valid_map
>>    tests: add fsck testcase of fixing sum entry nid
>>    tests: add fsck testcase of fixing sum footer type
>>    tests: add fsck testcase of fixing sum entry ofs_in_node
>>    tests: add fsck testcase of fixing inode invalid i_addr
>>    tests: add fsck testcase of fixing dentry hash code
>>    tests: add fsck testcase of fixing lost dots
>>    tests: add fsck testcase of fixing duplicated dots
>>    tests: add fsck testcase of fixing loop fsync dnodes
>>    tests: add inject testcase of injecting META area
>>    tests: add inject testcase of injecting node block
>>
>>   .gitignore                            |  14 +
>>   Makefile.am                           |   2 +-
>>   configure.ac                          |   1 +
>>   fsck/dump.c                           |  15 +-
>>   fsck/f2fs.h                           |  12 +-
>>   fsck/fsck.c                           |   2 +-
>>   fsck/fsck.h                           |   4 +-
>>   fsck/inject.c                         | 438 +++++++++++++++++++++-----
>>   fsck/inject.h                         |   1 +
>>   fsck/main.c                           |  14 +-
>>   fsck/mount.c                          |  61 ++--
>>   include/f2fs_fs.h                     |   1 +
>>   lib/libf2fs_zoned.c                   |   6 +-
>>   man/inject.f2fs.8                     |  43 ++-
>>   tests/Makefile.am                     |  26 ++
>>   tests/f_cp_bad_crc/README             |   5 +
>>   tests/f_cp_bad_crc/expect.in          |   4 +
>>   tests/f_cp_bad_crc/script             |  38 +++
>>   tests/f_dentry_bad_hash/README        |   8 +
>>   tests/f_dentry_bad_hash/expect.in     |   8 +
>>   tests/f_dentry_bad_hash/script        |  56 ++++
>>   tests/f_dentry_dup_dots/README        |  11 +
>>   tests/f_dentry_dup_dots/expect.in     |  26 ++
>>   tests/f_dentry_dup_dots/script        |  49 +++
>>   tests/f_dentry_lost_dots/README       |   7 +
>>   tests/f_dentry_lost_dots/expect.in    |  16 +
>>   tests/f_dentry_lost_dots/script       |  37 +++
>>   tests/f_inode_bad_iaddr/README        |   6 +
>>   tests/f_inode_bad_iaddr/expect.in     |  13 +
>>   tests/f_inode_bad_iaddr/script        |  50 +++
>>   tests/f_loop_fsync_dnodes/README      |   5 +
>>   tests/f_loop_fsync_dnodes/expect.in   |   6 +
>>   tests/f_loop_fsync_dnodes/script      |  46 +++
>>   tests/f_nat_bad_blkaddr/README        |   4 +
>>   tests/f_nat_bad_blkaddr/expect.in     |  12 +
>>   tests/f_nat_bad_blkaddr/script        |  25 ++
>>   tests/f_nat_bad_ino/README            |   4 +
>>   tests/f_nat_bad_ino/expect.in         |  12 +
>>   tests/f_nat_bad_ino/script            |  31 ++
>>   tests/f_sb_bad_magic/README           |   3 +
>>   tests/f_sb_bad_magic/expect.in        |   5 +
>>   tests/f_sb_bad_magic/script           |  15 +
>>   tests/f_sb_errors/README              |   5 +
>>   tests/f_sb_errors/expect.in           |   7 +
>>   tests/f_sb_errors/script              |  22 ++
>>   tests/f_sit_bad_type/README           |   5 +
>>   tests/f_sit_bad_type/expect.in        |   3 +
>>   tests/f_sit_bad_type/script           |  38 +++
>>   tests/f_sit_bad_valid_map/README      |   5 +
>>   tests/f_sit_bad_valid_map/expect.in   |   4 +
>>   tests/f_sit_bad_valid_map/script      |  43 +++
>>   tests/f_sit_bad_vblocks/README        |   5 +
>>   tests/f_sit_bad_vblocks/expect.in     |   3 +
>>   tests/f_sit_bad_vblocks/script        |  38 +++
>>   tests/f_ssa_bad_nid/README            |   5 +
>>   tests/f_ssa_bad_nid/expect.in         |   3 +
>>   tests/f_ssa_bad_nid/script            |  36 +++
>>   tests/f_ssa_bad_ofs_in_node/README    |   5 +
>>   tests/f_ssa_bad_ofs_in_node/expect.in |   3 +
>>   tests/f_ssa_bad_ofs_in_node/script    |  36 +++
>>   tests/f_ssa_bad_type/README           |   5 +
>>   tests/f_ssa_bad_type/expect.in        |   3 +
>>   tests/f_ssa_bad_type/script           |  31 ++
>>   tests/filter.sed                      |  69 ++++
>>   tests/helpers                         | 269 ++++++++++++++++
>>   tests/i_meta/README                   |   5 +
>>   tests/i_meta/expect.in                |  60 ++++
>>   tests/i_meta/script                   | 212 +++++++++++++
>>   tests/i_node/README                   |   5 +
>>   tests/i_node/expect.in                |  66 ++++
>>   tests/i_node/script                   | 166 ++++++++++
>>   tests/runtests.in                     |  48 +++
>>   tests/test_config.in                  |  53 ++++
>>   73 files changed, 2284 insertions(+), 116 deletions(-)
>>   create mode 100644 tests/Makefile.am
>>   create mode 100644 tests/f_cp_bad_crc/README
>>   create mode 100644 tests/f_cp_bad_crc/expect.in
>>   create mode 100644 tests/f_cp_bad_crc/script
>>   create mode 100644 tests/f_dentry_bad_hash/README
>>   create mode 100644 tests/f_dentry_bad_hash/expect.in
>>   create mode 100644 tests/f_dentry_bad_hash/script
>>   create mode 100644 tests/f_dentry_dup_dots/README
>>   create mode 100644 tests/f_dentry_dup_dots/expect.in
>>   create mode 100644 tests/f_dentry_dup_dots/script
>>   create mode 100644 tests/f_dentry_lost_dots/README
>>   create mode 100644 tests/f_dentry_lost_dots/expect.in
>>   create mode 100644 tests/f_dentry_lost_dots/script
>>   create mode 100644 tests/f_inode_bad_iaddr/README
>>   create mode 100644 tests/f_inode_bad_iaddr/expect.in
>>   create mode 100644 tests/f_inode_bad_iaddr/script
>>   create mode 100644 tests/f_loop_fsync_dnodes/README
>>   create mode 100644 tests/f_loop_fsync_dnodes/expect.in
>>   create mode 100644 tests/f_loop_fsync_dnodes/script
>>   create mode 100644 tests/f_nat_bad_blkaddr/README
>>   create mode 100644 tests/f_nat_bad_blkaddr/expect.in
>>   create mode 100644 tests/f_nat_bad_blkaddr/script
>>   create mode 100644 tests/f_nat_bad_ino/README
>>   create mode 100644 tests/f_nat_bad_ino/expect.in
>>   create mode 100644 tests/f_nat_bad_ino/script
>>   create mode 100644 tests/f_sb_bad_magic/README
>>   create mode 100644 tests/f_sb_bad_magic/expect.in
>>   create mode 100644 tests/f_sb_bad_magic/script
>>   create mode 100644 tests/f_sb_errors/README
>>   create mode 100644 tests/f_sb_errors/expect.in
>>   create mode 100644 tests/f_sb_errors/script
>>   create mode 100644 tests/f_sit_bad_type/README
>>   create mode 100644 tests/f_sit_bad_type/expect.in
>>   create mode 100644 tests/f_sit_bad_type/script
>>   create mode 100644 tests/f_sit_bad_valid_map/README
>>   create mode 100644 tests/f_sit_bad_valid_map/expect.in
>>   create mode 100644 tests/f_sit_bad_valid_map/script
>>   create mode 100644 tests/f_sit_bad_vblocks/README
>>   create mode 100644 tests/f_sit_bad_vblocks/expect.in
>>   create mode 100644 tests/f_sit_bad_vblocks/script
>>   create mode 100644 tests/f_ssa_bad_nid/README
>>   create mode 100644 tests/f_ssa_bad_nid/expect.in
>>   create mode 100644 tests/f_ssa_bad_nid/script
>>   create mode 100644 tests/f_ssa_bad_ofs_in_node/README
>>   create mode 100644 tests/f_ssa_bad_ofs_in_node/expect.in
>>   create mode 100644 tests/f_ssa_bad_ofs_in_node/script
>>   create mode 100644 tests/f_ssa_bad_type/README
>>   create mode 100644 tests/f_ssa_bad_type/expect.in
>>   create mode 100644 tests/f_ssa_bad_type/script
>>   create mode 100644 tests/filter.sed
>>   create mode 100644 tests/helpers
>>   create mode 100644 tests/i_meta/README
>>   create mode 100644 tests/i_meta/expect.in
>>   create mode 100644 tests/i_meta/script
>>   create mode 100644 tests/i_node/README
>>   create mode 100644 tests/i_node/expect.in
>>   create mode 100644 tests/i_node/script
>>   create mode 100644 tests/runtests.in
>>   create mode 100644 tests/test_config.in
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

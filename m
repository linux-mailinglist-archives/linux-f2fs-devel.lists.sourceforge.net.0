Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIiFEhFArmldBAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 04:35:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F02338BD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 04:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YG+pqzuQCHOciAPwtbsscXevqE7YW1l2ice6VT677TM=; b=E07jvkQdE6szegmRawsjnBIBOI
	siORf4O9cjWniVpn7Mxy3mnJ6O8ittsVaDNSrefDY2WIHPGSDAs0KYnSKLHEPo8EwWmFO2Ps+U7Ek
	u1AG4IL1qWmCyxRr5LsgbANpqZO44yL8GYKoxgramGR66cV1/D3VZDnuU/aQt6VPoBrg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzRP5-0005xT-AI;
	Mon, 09 Mar 2026 03:35:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vzROv-0005x0-Gb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 03:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDUKsNEa6sZs3sZU2incJAZ2JVdoTqtPtMRcnhu/ia4=; b=IH7jMcEvKoAX9/QmdJF2NOSY3O
 eySFHn/VM6Lo3bcqS86Cj/anL+Zh+fD1sIQSMtrr4A7Pnv+QA+c/JpD/AiDiRHYgwWn75jQ81hej7
 Su2tNTMR6IzRIxHokKGok63fXqmIDO4IDGhly5CUhOJ19ocxVyLwxVLx/vPrkn3LDxyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tDUKsNEa6sZs3sZU2incJAZ2JVdoTqtPtMRcnhu/ia4=; b=c3sg1M8wHzyDfS/AMr7Tiaz1Pu
 Hxe5W8sBeJN58t+dyg3nlZwD0DMcevoNJlzdm03cDCsiWZc6vKntp4ojsYOO5S+zSBKvMg49KBnhI
 6Qunv8MJ/UO2RQswiF75lg52DKbJtTJEeOck5z1eMUzd8PdyaJblE4ETRLuPf0Vv2Mfc=;
Received: from smtp153-168.sina.com.cn ([61.135.153.168])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzROu-0005jn-IC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 03:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773027324; bh=tDUKsNEa6sZs3sZU2incJAZ2JVdoTqtPtMRcnhu/ia4=;
 h=Message-ID:Date:Subject:From;
 b=TiabwaSlUopCVXIu7MrnH6SbtGmkF6kScJb4QRUAsKpmavB02FzOhFpPa6NWOewwG
 O0lOIegiLzEg9M6wvKobDTeJArP7Gwqw+FB95DCCJxAjxKyyKaQ7ip0B7Q2ct/HX4j
 cIdR+Be00M/krEQpj8zH9QapXN3/cJc/0Olw37JQ=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69AE3FED00006D17; Mon, 9 Mar 2026 11:35:11 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2867996685313
X-SMAIL-UIID: 05DAE809AE824C5F8B74F610929E80FC-20260309-113511-1
Message-ID: <d38a6b91-5731-4ba4-b038-0d50720dea3d@sina.com>
Date: Mon, 9 Mar 2026 11:35:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260305125015.1717396-2-monty_pavel@sina.com>
 <8accb7ba-4e97-4484-8e7d-98ce126c0369@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <8accb7ba-4e97-4484-8e7d-98ce126c0369@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/9/26 11:00, Chao Yu via Linux-f2fs-devel wrote: > On
 3/5/26 20:50, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> Add a flags
 parameter to the fiemap subcommand, allowing the >> specificatio [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vzROu-0005jn-IC
Subject: Re: [f2fs-dev] [PATCH v3] f2fs_io: add flags parameter to fiemap
 subcommand
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: E38F02338BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On 3/9/26 11:00, Chao Yu via Linux-f2fs-devel wrote:
> On 3/5/26 20:50, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> Add a flags parameter to the fiemap subcommand, allowing the
>> specification of whether to retrieve file mappings after writing to the
>> file.
>>
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>>  man/f2fs_io.8           |  2 +-
>>  tools/f2fs_io/f2fs_io.c | 15 +++++++++++----
>>  2 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
>> index 5c3d204..51ccfaf 100644
>> --- a/man/f2fs_io.8
>> +++ b/man/f2fs_io.8
>> @@ -138,7 +138,7 @@ mmap(MAP_POPULATE)
>>  mmap() + mlock()
>>  .RE
>>  .TP
>> -\fBfiemap\fR \fI[offset in 4kb] [count] [file_path]\fR
>> +\fBfiemap\fR \fI[offset in 4kb] [count] [file_path] {flags}\fR
>>  get block address in file
>>  .TP
>>  \fBgc_urgent\fR \fIdev [start|end|run] [time in sec]\fR
>> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
>> index c977f4d..9bca498 100644
>> --- a/tools/f2fs_io/f2fs_io.c
>> +++ b/tools/f2fs_io/f2fs_io.c
>> @@ -1357,8 +1357,11 @@ static void do_randread(int argc, char **argv, const struct cmd_desc *cmd)
>>  }
>>  
>>  #define fiemap_desc "get block address in file"
>> -#define fiemap_help					\
>> -"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path]\n\n"\
>> +#define fiemap_help							\
>> +"f2fs_io fiemap [offset in 4kb] [count in 4kb] [file_path] {flags}\n\n"	\
>> +"flags can be the following values:\n"					\
>> +"0: No extra actions, by default\n"					\
>> +"1: Sync file data before map\n"					\
> 
> What about supporting all flags below? although we didn't limit supporting
> all bits in code part.
> 
> /* flags used in fm_flags: */
> #define FIEMAP_FLAG_SYNC	0x00000001 /* sync file data before map */
> #define FIEMAP_FLAG_XATTR	0x00000002 /* map extended attribute tree */
> #define FIEMAP_FLAG_CACHE	0x00000004 /* request caching of the extents */

It's more appropriate. I'll add all these flag values to the help text
in the v4 patch.

Thanks
Yongpeng,

> 
> Thanks,
> 
>>  
>>  #if defined(HAVE_LINUX_FIEMAP_H) && defined(HAVE_LINUX_FS_H)
>>  static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>> @@ -1366,10 +1369,10 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>>  	unsigned int i;
>>  	int fd, extents_mem_size;
>>  	u64 start, length;
>> -	u32 mapped_extents;
>> +	u32 mapped_extents, flags = 0;
>>  	struct fiemap *fm = xmalloc(sizeof(struct fiemap));
>>  
>> -	if (argc != 4) {
>> +	if (argc < 4 || argc > 5) {
>>  		fputs("Excess arguments\n\n", stderr);
>>  		fputs(cmd->cmd_help, stderr);
>>  		exit(1);
>> @@ -1378,8 +1381,11 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>>  	memset(fm, 0, sizeof(struct fiemap));
>>  	start = (u64)atoi(argv[1]) * F2FS_DEFAULT_BLKSIZE;
>>  	length = (u64)atoi(argv[2]) * F2FS_DEFAULT_BLKSIZE;
>> +	if (argc == 5)
>> +		flags = (u32)atoi(argv[4]);
>>  	fm->fm_start = start;
>>  	fm->fm_length = length;
>> +	fm->fm_flags = flags;
>>  
>>  	fd = xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);
>>  
>> @@ -1397,6 +1403,7 @@ static void do_fiemap(int argc, char **argv, const struct cmd_desc *cmd)
>>  	memset(fm, 0, sizeof(struct fiemap) + extents_mem_size);
>>  	fm->fm_start = start;
>>  	fm->fm_length = length;
>> +	fm->fm_flags = flags;
>>  	fm->fm_extent_count = mapped_extents;
>>  
>>  	if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

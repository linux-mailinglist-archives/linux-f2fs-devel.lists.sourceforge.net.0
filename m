Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CF9AB49A9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 04:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUwdgCJDAb5mwE9yjF0UeL7qZbK2v1T2cDek5r+62RE=; b=bEf4Tr6a81cQw7gslI8dU5p5QO
	AMjMyUksIm55ZJUroKdArGge36PEiZBroUHywBfQ1SeqlNQChWhNOf9tz12XZbh3NXvqrK0qw+UoQ
	ox4bQnmX+2lhws8Req7JvkS/8FurU2K7OmBpSt84XjlTBpFzJDGfFi2LcT0AEV+kV0wU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEfeE-0002rw-Cf;
	Tue, 13 May 2025 02:45:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEfeD-0002ro-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HT+XNeb3Xb8QQUjXh6vSE+gjOiCPCJM8wjaz7TzCmtQ=; b=Q1dH0gYwnxXn/PkFg3X5yMk+Db
 R3XtegyGeEZDRjNUqAxD9hvOTD0tUI5rBSePDgIRjggYgXtWKqhRaOKsFEvII12e8ORPv4lhnB16U
 vNDTfus5PDBVvKM92z7vDdQgxRibkNcKlo1Zm7WaO6zi3jeetKgA247c/ql58iPuWtY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HT+XNeb3Xb8QQUjXh6vSE+gjOiCPCJM8wjaz7TzCmtQ=; b=HazlOuznJR+FY0S1rN/+f9MJEF
 5Et15UdUWVpc8k/dHfkUrmkhTph3SUigiuasL7opm5ie+mTEuRfIYjKSzpaWwZw2HNs0meYMgD22o
 wUjXPe/ATOq1ef98qiuuosSHA5h3r4QUV7aKem3m7zWNkkC36kpbs3MkdPhNCKcNUyHs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEfeC-0000nK-DE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ABD06629D8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 May 2025 02:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A809C4CEE7;
 Tue, 13 May 2025 02:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747104325;
 bh=NkWPYggq97UhPZ6nY6Tgfs6p7CE1uNPUe8N4Da5ZLZU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Xbvuhv5vB05UBWs2cAexjXEu0pS7knoeV4jGHE4PjVmWg/8CHrz35C1ZdPUOMZXRl
 CZXXxdtsNpl1MvEucq0JdAQSLJECsp3AryQEtRxOOugXRIB4g/5o5/7EDv0plHrw9F
 Af8/2d1LjyGbecnWhOKjoD8JWi2ZqOHdVFuNt0KKdOyPW+62SEHRDtAjGgtnvONs/k
 Esg+uGbph6LwO0dKCj+1zJlWVUtRkPauvvDytHOplcbAIKvWgI6ia+pxbQt+FUoAEl
 7AJZVUH+87ffXM843NxkY0jj6n0Fv1oafIEAXuOAHwjxFk34ZhJqisU8R+SpTpifss
 GH5uP++Tzwd6A==
Message-ID: <44e7161a-0da8-442b-9849-7fe7e51c83f3@kernel.org>
Date: Tue, 13 May 2025 10:45:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250512115442.2640895-1-chao@kernel.org>
 <20250512115442.2640895-2-chao@kernel.org> <aCITTEkOYqZdYTy1@google.com>
Content-Language: en-US
In-Reply-To: <aCITTEkOYqZdYTy1@google.com>
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/12/25 23:27, Jaegeuk Kim wrote: > On 05/12,
 Chao Yu wrote: >> mapping_read_folio_gfp() will return a folio,
 it should always be >> uptodate, 
 let's check folio uptodate status to detect any poteni [...] 
 Content analysis details:   (-1.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEfeC-0000nK-DE
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add f2fs_bug_on() in
 f2fs_quota_read()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/12/25 23:27, Jaegeuk Kim wrote:
> On 05/12, Chao Yu wrote:
>> mapping_read_folio_gfp() will return a folio, it should always be
>> uptodate, let's check folio uptodate status to detect any potenial
>> bug.
> 
> If it's supposed to be uptodate, can you add f2fs_bug_on() only?

Sure.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/super.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 0ee783224953..ea207a9edc10 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2973,6 +2973,17 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>>  			goto repeat;
>>  		}
>>  
>> +		/*
>> +		 * should never happen, just leave f2fs_bug_on() here to catch
>> +		 * any potential bug.
>> +		 */
>> +		if (unlikely(!folio_test_uptodate(folio))) {
>> +			f2fs_folio_put(folio, true);
>> +			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
>> +			f2fs_bug_on(F2FS_SB(sb), 1);
>> +			return -EIO;
>> +		}
>> +
>>  		memcpy_from_folio(data, folio, offset, tocopy);
>>  		f2fs_folio_put(folio, true);
>>  
>> -- 
>> 2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

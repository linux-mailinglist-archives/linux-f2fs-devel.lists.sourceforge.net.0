Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AFC248151
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 11:05:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7xYB-0008HH-Tk; Tue, 18 Aug 2020 09:04:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k7xYA-0008Ga-2q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 09:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C9ZC6fhiccZ0xTICmRgMiFknyO4yTm9DCkuUnYEOSCU=; b=AQ5unHBkVXUQUILH63Kj6qQ0jH
 BZpNaHOPgcUmxVR6Z9XofQLUxCeD2tP2cMN24rbFKBuxmhN1E4PZtA2kPUtbbHAPZ8O+HBmhRfrCL
 sDt9ZuLSzs5B9ZdmQPQgzXpwG3Wmqxk8OlOOCXHEmeGrarZQyV1x6hcEg9yHj+J/PXPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C9ZC6fhiccZ0xTICmRgMiFknyO4yTm9DCkuUnYEOSCU=; b=EvbJBIpUXyiOlJSYQIcjdnUT04
 b09PssCepFRZTdKA5G8oGKnn9gzS48wzGWCB1//QuAZIzB/LW4nGbpyO0Z2Gx1bpTdu2p7k/NTDuK
 5d/O1qTFBV6nyzfvk6UzA3j+i3HZzrldsOnjbZp5TBL3cE4XqihlSPa3TmPQ3WsGxUWE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k7xY8-00BEnS-Fc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 09:04:58 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B413ECF1AFBA64835D15;
 Tue, 18 Aug 2020 17:04:44 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 18 Aug
 2020 17:04:39 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200805080913.48133-1-yuchao0@huawei.com>
 <20200818065206.GA3751716@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e1c15f51-7ee5-5791-d7e1-af2aee0a2057@huawei.com>
Date: Tue, 18 Aug 2020 17:04:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200818065206.GA3751716@google.com>
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k7xY8-00BEnS-Fc
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: correct return value
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
Cc: nolange79@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/18 14:52, Jaegeuk Kim wrote:
> On 08/05, Chao Yu wrote:
>> As Norbert Lange reported:
>>
>> "
>> $ fsck.f2fs -a /dev/mmcblk0p5; echo $?
>> Info: Fix the reported corruption.
>> Info: Mounted device!
>> Info: Check FS only on RO mounted device
>> Error: Failed to open the device!
>> 255
>> "
>>
>> Michael La=DF reminds:
>>
>> "
>> I think the return value is exactly the problem here. See fsck(8) (
>> https://linux.die.net/man/8/fsck) which specifies the return values.
>> Systemd looks at these and decides how to proceed:
>>
>> https://github.com/systemd/systemd/blob/a859abf062cef1511e4879c4ee39c603=
6ebeaec8/src/fsck/fsck.c#L407
>>
>> That means, if fsck.f2fs returns 255, then
>> the FSCK_SYSTEM_SHOULD_REBOOT bit is set and systemd will reboot.
>> "
>>
>> So the problem here is fsck.f2fs didn't return correct value to userspace
>> apps, result in later unexpected behavior of rebooting, let's fix this.
>>
>> Reported-by: Norbert Lange <nolange79@gmail.com>
>> Reported-by: Michael La=DF <bevan@bi-co.net>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fsck/fsck.h | 11 +++++++++++
>>   fsck/main.c | 27 +++++++++++++++++++++------
>>   2 files changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/fsck/fsck.h b/fsck/fsck.h
>> index e86730c34fc4..c5e85fefa07b 100644
>> --- a/fsck/fsck.h
>> +++ b/fsck/fsck.h
>> @@ -13,6 +13,17 @@
>>   =

>>   #include "f2fs.h"
>>   =

>> +enum {
>> +	FSCK_SUCCESS                 =3D 0,
>> +	FSCK_ERROR_CORRECTED         =3D 1 << 0,
>> +	FSCK_SYSTEM_SHOULD_REBOOT    =3D 1 << 1,
>> +	FSCK_ERRORS_LEFT_UNCORRECTED =3D 1 << 2,
>> +	FSCK_OPERATIONAL_ERROR       =3D 1 << 3,
>> +	FSCK_USAGE_OR_SYNTAX_ERROR   =3D 1 << 4,
>> +	FSCK_USER_CANCELLED          =3D 1 << 5,
>> +	FSCK_SHARED_LIB_ERROR        =3D 1 << 7,
>> +};
>> +
>>   struct quota_ctx;
>>   =

>>   #define FSCK_UNMATCHED_EXTENT		0x00000001
>> diff --git a/fsck/main.c b/fsck/main.c
>> index 9a1596f35e79..11d472b9941c 100644
>> --- a/fsck/main.c
>> +++ b/fsck/main.c
>> @@ -630,7 +630,7 @@ void f2fs_parse_options(int argc, char *argv[])
>>   	error_out(prog);
>>   }
>>   =

>> -static void do_fsck(struct f2fs_sb_info *sbi)
>> +static int do_fsck(struct f2fs_sb_info *sbi)
>>   {
>>   	struct f2fs_checkpoint *ckpt =3D F2FS_CKPT(sbi);
>>   	u32 flag =3D le32_to_cpu(ckpt->ckpt_flags);
>> @@ -655,7 +655,7 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>>   			} else {
>>   				MSG(0, "[FSCK] F2FS metadata   [Ok..]");
>>   				fsck_free(sbi);
>> -				return;
>> +				return FSCK_SUCCESS;
>>   			}
>>   =

>>   			if (!c.ro)
>> @@ -687,7 +687,7 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>>   		ret =3D quota_init_context(sbi);
>>   		if (ret) {
>>   			ASSERT_MSG("quota_init_context failure: %d", ret);
>> -			return;
>> +			return FSCK_OPERATIONAL_ERROR;
>>   		}
>>   	}
>>   	fsck_chk_orphan_node(sbi);
>> @@ -695,8 +695,14 @@ static void do_fsck(struct f2fs_sb_info *sbi)
>>   			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, NULL);
>>   	fsck_chk_quota_files(sbi);
>>   =

>> -	fsck_verify(sbi);
>> +	ret =3D fsck_verify(sbi);
>>   	fsck_free(sbi);
>> +
>> +	if (!c.bug_on)
>> +		return FSCK_SUCCESS;
>> +	if (!ret)
>> +		return FSCK_ERROR_CORRECTED;
> =

> I applied this to get FSCK_ERROR_CORRECTED.
> =

> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -3165,6 +3165,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>                          is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
>                          write_checkpoints(sbi);
>                  }
> +               /* to return FSCK_ERROR_CORRECTED */
> +               ret =3D 0;

Correct, thanks. :)

Thanks,

>          }
>          return ret;
>   }
> =

>> +	return FSCK_ERRORS_LEFT_UNCORRECTED;
>>   }
>>   =

>>   static void do_dump(struct f2fs_sb_info *sbi)
>> @@ -833,11 +839,15 @@ int main(int argc, char **argv)
>>   	if (c.func !=3D DUMP && f2fs_devs_are_umounted() < 0) {
>>   		if (errno =3D=3D EBUSY) {
>>   			ret =3D -1;
>> +			if (c.func =3D=3D FSCK)
>> +				ret =3D FSCK_OPERATIONAL_ERROR;
>>   			goto quick_err;
>>   		}
>>   		if (!c.ro || c.func =3D=3D DEFRAG) {
>>   			MSG(0, "\tError: Not available on mounted device!\n");
>>   			ret =3D -1;
>> +			if (c.func =3D=3D FSCK)
>> +				ret =3D FSCK_OPERATIONAL_ERROR;
>>   			goto quick_err;
>>   		}
>>   =

>> @@ -854,6 +864,8 @@ int main(int argc, char **argv)
>>   	/* Get device */
>>   	if (f2fs_get_device_info() < 0) {
>>   		ret =3D -1;
>> +		if (c.func =3D=3D FSCK)
>> +			ret =3D FSCK_OPERATIONAL_ERROR;
>>   		goto quick_err;
>>   	}
>>   =

>> @@ -873,7 +885,7 @@ fsck_again:
>>   =

>>   	switch (c.func) {
>>   	case FSCK:
>> -		do_fsck(sbi);
>> +		ret =3D do_fsck(sbi);
>>   		break;
>>   #ifdef WITH_DUMP
>>   	case DUMP:
>> @@ -935,8 +947,11 @@ retry:
>>   		}
>>   	}
>>   	ret =3D f2fs_finalize_device();
>> -	if (ret < 0)
>> +	if (ret) {
>> +		if (c.func =3D=3D FSCK)
>> +			return FSCK_OPERATIONAL_ERROR;
>>   		return ret;
>> +	}
>>   =

>>   	printf("\nDone: %lf secs\n", (get_boottime_ns() - start) / 1000000000=
.0);
>>   	return 0;
>> -- =

>> 2.26.2
> .
> =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

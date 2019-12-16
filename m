Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB8120757
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2019 14:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1igqap-0006qy-DP; Mon, 16 Dec 2019 13:39:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <Markus.Elfring@web.de>) id 1igqan-0006qr-TW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 13:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cI13DIt9ndIgXKAK0JZs7m5CG6cqEz2muU6/fSwWSRw=; b=IKsfL3n3SiSoszOTVLMJB52T+D
 9v2PRM6PEhBhMYu2Rbg5/abE8xKHxzY26j9B1DKzeRrihT2NnEJqmdD6FmpCC1zCs1p6KuMUTDgt6
 XL+uKFAAoRAJi4WM/3U5WH8vwBngAvwfTgiZ/SuXQ8NsULS9i6CTBomnRbpqp4UB2MQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cI13DIt9ndIgXKAK0JZs7m5CG6cqEz2muU6/fSwWSRw=; b=iDr4+MEYqizvaP9AwrALrccn0R
 y3SKc00wDi7JvgDWX66PQwOKfPkZTL6rmKBDrhIBY+0cYrxh9xA0v781hOrTKcpfZGMYaJ0nxnKy5
 Vrog6+xTz4xU2IYqeLOJEou2k8h+TYJ/m4XxNfsEivivuXKNugGy+NoZEErP9vCaRWhc=;
Received: from mout.web.de ([217.72.192.78])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1igqak-006gdS-BM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 13:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1576503532;
 bh=cI13DIt9ndIgXKAK0JZs7m5CG6cqEz2muU6/fSwWSRw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=aNalQOK3TObnaPfJMAya3caHusFU1nUmu9ZR9mGniOGcD7pOZP2byPofSvqvux+GM
 oYWnc5tUGLcsQ9WO/uEotE+t7tSS/yPGAsOYlqA135GhxY3dKkMSqCOdIMWsed7FMR
 6Rs9HBL4iF9M4kBfVBpMx3gmLgkqVHSingN9oEpU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.48.181.202]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ljaiq-1i9hci0kaO-00bcvz; Mon, 16
 Dec 2019 14:38:52 +0100
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <0ab8c593-d043-cdf6-7805-f7bceba8e519@web.de>
 <0677a4fd-62a5-ad98-fd02-ae7d5a9cb501@kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b1a2b133-ab92-eb14-ccfe-5d584ed8bb0c@web.de>
Date: Mon, 16 Dec 2019 14:38:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <0677a4fd-62a5-ad98-fd02-ae7d5a9cb501@kernel.org>
Content-Language: en-US
X-Provags-ID: V03:K1:jdaRAPWj5AfZiyrQnlpaE3labKptoGbAnTS85sqGcf2zcz5P/To
 xApbn60yW12MMbsD74zdgRH3kIRCbSIY1v2EccmJc+oJOPek6jFh0mf0hL1O8xQkx2N7Ms1
 Kgg5UC2xkpCsjSRi/C9c18YWLhyHgKr7jjAgF1a4Nw9E4oJQwlR37/xd+lDt5hg6esyH6ok
 UAwcthbRwJYOiPHAvg8WA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FDiS6W5Zv8w=:nY9UWrEAk7lO+L3XExkl5q
 sTGCcMzdBvGb/Y6+kkIL42FVeFJoGpVfAs8/ghhncqhErZ71Pdt5O/Xfb0w/Llgv6p+7MaB+8
 3VudSh1IJyQq9o5K4Rphe2gv6geITOzxdjJbLGx4KhiipNUORr4ic9UVIjOBnUaRZEHjfLhsH
 tcH/pxldld+XmWPFDRXsUPENp1ZMg2xJ39/TVSS4IQw2BmZYMTmfR7OHgJrq9qQfRwVcKjHVV
 VdMSkBFAO/QKW1GbgOaZOzETrg+LDRt+Ohm+3o3I0OFgI8VPtMoCjU9yrEL9dD43jv/4406K4
 sDQ5/txXyQI08SdXewtkMvZ2VQhJnqXh2ZT2jQ4msRwSZc0EfPfFbTatuIr+Tddyf9yxiL2U3
 XFp72bvJwrc364A9MaYQep4yNUT394eHcT2inMC/F8tFF+/mdKSOBZrTZXXeNg8e6CsGcCxkj
 g8vbfovh5brHoYBZv2WS8CxmDEgc2vOAlnwPF8oqXSpfyOFVmTbvAUYhwUtRweoKO+UEXwci/
 nJ8m1tbRovm16aCBDToUoHWjlCgzrmcq56n6sI8tq8YvSTtFvrU5CKKaPnRWg1EvwuDYT3Dvv
 PfAqzcHfZzpKn9Ck6LwKNUWnqP94QXAKWY6f5DKtee/vjpoPU6TG0JRpxNdOcXdHC8L0c9ppK
 jbZ327yIkFFa8vTdHA2qBXw7fga/BkAWjwzSrj+EZYsA0L53oHKjz+gAA6/ugMcY5q+0DMhW6
 xy3pASQbqG8HdFbpkYDP3GLutero3DiPAMGXHakBcsroV3G0IoJMXU5qSfGh0SzoW76V6tk8K
 Eu2dPa4EplL/FkpKtrZ9YjwtexwkT0kttv7UUaxa3+qxvWwQAsY4vJQkV/ahtL5L2K8QsOllT
 uNXjaSNJqoK/IafGkKMW2df6VfTaEJsTjMMHkAzGDOK6xIajYKZd1lIHJr4E3dps/ieH1mzRO
 yI5VOcuTs/DwVI9wLF3FP1CUKlzRiBXgHjsL7tygTo/rhlXzW7+xevjMXZAf8enZzI8Yuwnmc
 RShZPrRKTueldh8n41+iJzThBpT4I6wAOqsMlAOCoolfMs//VzesclaHPk2LiofuZ5ePT/ZZ4
 ooYKADvzsf/vAkd4DGSPGcxoLA2vDI/Dw/ut4DFtbRt7hUbXDO8Z4L7wLI27RsBDOLCezy0U+
 gKe7mWJByN79s/0iuzTdL3v4R6+pMgFYiauCMAtj9cyVjjeBMK3x9sYSL+0lu1OxCIFG78doo
 iMXQ4LtUkZ7kJIJam6N9UDa6i0FkD8VLxuSZzsBwk0AliUqo3nRbzrnE+XXY=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (markus.elfring[at]web.de)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1igqak-006gdS-BM
Subject: Re: [f2fs-dev] [v5] f2fs: support data compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>> +bool f2fs_is_compressed_page(const struct page *page);
>>
>>
>> Would you like to improve const-correctness at any more source code places?
>
> I can't figure out a good reason to do that for f2fs internal functions...

Do you insist to keep such a function parameter mutable?

Regards,
Markus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

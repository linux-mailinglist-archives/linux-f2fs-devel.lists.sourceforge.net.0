Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5F85280C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 05:44:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZkex-000715-FG;
	Tue, 13 Feb 2024 04:44:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rZkev-00070y-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 04:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=58R04AHcQRmeOu/wlEbknZFydjDjKXBAo0c+7rh9Gp0=; b=UGzI1R5SnuZSsU0sDQEZBwQL8g
 Tw3qGK8EKQOdR0xupSe9Eu3LM92h9QdTG+XkD/VjbgCWXNy4H81PokYZeZPYINIHlyhEtr6a97dqC
 r1lZHK3/KaHVhOKgDJtwsF/8y49K5CN+dn99sH8p05D/KcQqrLxV2CYznF52kCegNupM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=58R04AHcQRmeOu/wlEbknZFydjDjKXBAo0c+7rh9Gp0=; b=IEcnfQgMuEtGhx9XHAD02Opss0
 +VjmQdObT7wl6nPgN0jgipPKTRhRZkvpkMcq7etmB5kKM1c0RgNCUijE6XsH4Cl0ARDRreizo0a0t
 MgqRGh9tCB1SLUoYSkz3OehGDnks7UqvknZ+bFEFtzpCukS9oYEllXFGNiNQebfOPFbo=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rZkeq-0007yG-2N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 04:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707799465;
 bh=gnalbakfUEoOVuduLGkajwEg9F3QSmxtaFgbnbfzLCg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FO3zXqG/u0XUNzD7u/XRn6hsYQgbLHIKn7VBtzv1ogBR6c1s7hpxxn8ePE0/FcXzy
 svO99ZISnkx8X5b2W7WUDPDd/lrLIm+wMAouCKv2rf2dZIhHrJxqRcS3jlRxUIU/Tq
 L5XEKFCNde8m/eP4QyRKASXFVjF2PdTWXBCkqws4lpLUOff1GFaGHQfYZNXg0j85i8
 cYIgYlM6BEbDBZZWo+CD/pfsj7yeAvWI/DlBJYmwJ+Y7uvLCwDcCgzzSzIPr6RfigF
 S2o12acOiDEHMtfdtnAzZgyHR+lAB/0UutA1i+4CmUKFIXiwjNvspFJUFgJgQLrTQG
 0ofxPSOZUnOjA==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B67EF378203B;
 Tue, 13 Feb 2024 04:44:20 +0000 (UTC)
Message-ID: <1b7d51df-4995-4a4a-8ec4-f1ea4975e44c@collabora.com>
Date: Tue, 13 Feb 2024 06:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gabriel Krisman Bertazi <krisman@suse.de>
References: <20240208064334.268216-1-eugen.hristev@collabora.com>
 <20240208064334.268216-2-eugen.hristev@collabora.com>
 <87ttmivm1i.fsf@mailhost.krisman.be>
 <ff492e0f-3760-430e-968a-8b2adab13f3f@collabora.com>
 <87plx5u2do.fsf@mailhost.krisman.be>
Content-Language: en-US
In-Reply-To: <87plx5u2do.fsf@mailhost.krisman.be>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/9/24 16:40,
 Gabriel Krisman Bertazi wrote: > Eugen Hristev
 <eugen.hristev@collabora.com> writes: > >> On 2/8/24 20:38, Gabriel Krisman
 Bertazi wrote: > >>> (untested) >> >> I implemented your sug [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rZkeq-0007yG-2N
Subject: Re: [f2fs-dev] [RESEND PATCH v9 1/3] libfs: Introduce
 case-insensitive string comparison helper
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 Eric Biggers <ebiggers@google.com>, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/9/24 16:40, Gabriel Krisman Bertazi wrote:
> Eugen Hristev <eugen.hristev@collabora.com> writes:
> 
>> On 2/8/24 20:38, Gabriel Krisman Bertazi wrote:
> 
>>> (untested)
>>
>> I implemented your suggestion, but any idea about testing ? I ran smoke on xfstests
>> and it appears to be fine, but maybe some specific test case might try the
>> different paths here ?
> 
> Other than running the fstests quick group for each affected filesystems
> looking for regressions, the way I'd do it is create a few files and
> look them up with exact and inexact name matches.  While doing that,
> observe through bpftrace which functions got called and what they
> returned.
> 
> Here, since you are testing the uncached lookup, you want to make sure
> to drop the cached version prior to each lookup.
> 


Hello Gabriel,

With the changes you suggested, I get these errors now :

[  107.409410] EXT4-fs error (device sda1): ext4_lookup:1816: inode #521217: comm
ls: 'CUC' linked to parent dir
ls: cannot access '/media/CI_dir/CUC': Structure needs cleaning
total 8
drwxr-xr-x 2 root root 4096 Feb 12 11:51 .
drwxr-xr-x 4 root root 4096 Feb 12 11:47 ..
-????????? ? ?    ?       ?            ? CUC

Do you have any idea about what is wrong ?

Thanks,
Eugen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7088D5F53
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 May 2024 12:13:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCzG1-0004YH-Ep;
	Fri, 31 May 2024 10:13:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1sCzG0-0004YA-B6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 10:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ef6WEAdxw4OTGDot5zwBw2x/ODyOBKM8w0T0YgQqOXs=; b=bufpwjjYGA6T8YeQn1LAvMyb/9
 A3+gYqQvpMYjpJ4hX4yzsnqDIfKEAySYzrMQZXALG6dZaHjjXJ0KFzLCZdxkkE0XFUEhTUYnW7mT5
 C5mi4eBkg1LLvO2AAN+qhK41nYCeNkZvMfLuaYGzdwa8lczdwdbnhtrVPf8p1TJd2MZo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ef6WEAdxw4OTGDot5zwBw2x/ODyOBKM8w0T0YgQqOXs=; b=dlxHJ4BgR8HMyg6uCr6nj+VcLE
 gUIknxnGOWTALVzXIFuAX3WK7CWiBhhpLPQJWDKd6M5xwJk3Vx+hY96YlaH9vbmZ36z3ggidJoAwB
 hmg9jcvVc1E9iOdSdGcOwihhzPSZTK46Xhq4YLb/merRGRDHC+YHoU6JSogknwvyjUs0=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCzG0-0003zd-Is for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 10:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717150381;
 bh=uCrhf4ZOEnBO4VCk1/sMCeJBzWOouCqL5FtZQg3xdRY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RVKM9Yn/XzYfONe6xRHXS1zvr3ge+TieARHvTR+IRkgYIn9RHNB57tjTkw4xFAwEs
 7G2B+xWvTq1ZG+U9GftFQ8VEMnwae/1mBtn5iJdHr65foVxthb/csRTFhvCNY2VsPo
 x9x/pjAt3WodU6aIUHdphxfi1e7nazCVu7rEO1s3WJcSuNHSXv720Hg2Qu03Arky4X
 m+Vi9gKPDfPTaCSzUl6hIiqDnPWA0ZmLIvvQPDnKdkjehO/xKGn8aG83kCuJCBNG25
 Rocv4lj3do+i2luupO72TcteaCjCrdDio3Xg6eekfoFhu2JHTAKcPZhJlCAJz1J7/j
 HvotI5iWHoW7w==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 693D837821C1;
 Fri, 31 May 2024 10:13:00 +0000 (UTC)
Message-ID: <c6d7ddfe-9e16-4836-b285-d43dd16853fe@collabora.com>
Date: Fri, 31 May 2024 13:12:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>
References: <20240529082634.141286-1-eugen.hristev@collabora.com>
 <20240529082634.141286-4-eugen.hristev@collabora.com>
 <20240531044851.GE6505@sol.localdomain>
Content-Language: en-US
In-Reply-To: <20240531044851.GE6505@sol.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/31/24 07:48, Eric Biggers wrote: > On Wed, May 29, 2024
 at 11:26:30AM +0300, Eugen Hristev via Linux-f2fs-devel wrote: >> + /* >>
 + * Attempt a case-sensitive match first. It is cheaper and >> + [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [46.235.227.194 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [46.235.227.194 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [46.235.227.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCzG0-0003zd-Is
Subject: Re: [f2fs-dev] [PATCH v17 3/7] libfs: Introduce case-insensitive
 string comparison helper
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/31/24 07:48, Eric Biggers wrote:
> On Wed, May 29, 2024 at 11:26:30AM +0300, Eugen Hristev via Linux-f2fs-devel wrote:
>> +	/*
>> +	 * Attempt a case-sensitive match first. It is cheaper and
>> +	 * should cover most lookups, including all the sane
>> +	 * applications that expect a case-sensitive filesystem.
>> +	 */
>> +
>> +	if (dirent.len == (folded_name->name ? folded_name->len : name->len) &&
>> +	    !memcmp(name->name, dirent.name, dirent.len))
>> +		goto out;
> 
> Shouldn't it be just 'name->len' instead of
> '(folded_name->name ? folded_name->len : name->len)'?

Okay, I will change it. I am also waiting for other reviews to prepare the next
version.

Thanks for looking at this.

Eugen
> 
> - Eric
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

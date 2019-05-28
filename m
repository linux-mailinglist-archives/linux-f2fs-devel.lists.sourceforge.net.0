Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88B2C43E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 May 2019 12:29:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVZLq-0007vN-3q; Tue, 28 May 2019 10:29:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hVZLo-0007v0-9o
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 10:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UyHn0RE0aiLnNwnTLnusG082I0St5QJtdWvemhhSvGk=; b=I68SDNF7IOVC4zJUEA43wAWLdD
 cx1dhJ44wNVXa5upNMw+ke9nKaEBnVnWnMyIWmlblmIx5lRFyFZb2JmO4Kcr2NP60O4Bel+5C3bpb
 5fjYhPfAb6V+Bnkk+GAduOkEqNAxFzQa0+jIV4AFsKGJnJ9C/zBVzO4A/WVre+U9niuw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UyHn0RE0aiLnNwnTLnusG082I0St5QJtdWvemhhSvGk=; b=YOHcIbawzq1xoAplFH0G4tZ9+O
 MRJabG6c16zHlMBEwjk5F0iVwiGjpUq47X5xN/f6IIklZs9fAnHNpuYVdCDv5Z/inh3A27lxRfZ3E
 cW9i6CTmXB/kFkRGIxdZczFhEJPAaZFmLdTjQQTkb8pd1ZBF3WdGBFE5MDkMMPyTcKY4=;
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hVZLn-000hTq-2T
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 May 2019 10:29:00 +0000
Received: by mail-qk1-f196.google.com with SMTP id t64so21514955qkh.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 May 2019 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UyHn0RE0aiLnNwnTLnusG082I0St5QJtdWvemhhSvGk=;
 b=fKxqz3PKBWQqg301kJcPVGzXYW07Kb+hM3cO0JWFCQbfR8zQHifcOxLL5jYKEXfABX
 AHLffuJ8e6+b3By/uOhSBN2zqL/PyvcvXc3J8KVqfRQ8Qokq8scMQ/pgABtukwZgyiia
 dqA04EwVn5pRPx+wquS2dn1z3tDF2M16kjpL12zD8HEa5naFNX25uC3rMmPmh0mgy3qI
 5jyBRkFJLA3QbUHle+DQMAqlSOMMmJX4uin3G4ASFUlDfjCvPBmnatehzVv1T5Ck7Ktq
 W/z1OiMSofLU8dO8ReeY1mePyl4owyxdABJgW0jeTS2XkHf+Zd8EgChAD4Ju6IIZMPz+
 MJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyHn0RE0aiLnNwnTLnusG082I0St5QJtdWvemhhSvGk=;
 b=N2xsPpXA2gIDVU9IEAF4N0ahhZ0nxs5uZsc2siHh4oFxKAQHkava+P2ae/OqFW38Gw
 rlrdh7i15Rmyord1CRnHLCL+wR7ZDPdyxMT9InU6eFvhvqgqG2fbK5N0PFigzG9YWEjz
 kbu58SI64JyOlIJBfHssRaUhTU41zj8ba0M0gu4yZWjjOxROuyOPJhK37q9MByI0COm4
 8jwFlHM0PJYgUbM8n3gVkpjhVNpKlBmqvXEY9FMrmFkyobr0P7blZ6BO5dBQH7s+M6YX
 DiRZY7igV6LSh83iaxdKVt8rr1aWj/4Nmo0bEEqeODEjf0D45v3/mKWFKr+5UJZN+kmr
 lYyA==
X-Gm-Message-State: APjAAAXy4gJqEIAkKznDeKpT2bdL3fKO669UFHeCJCcPC9MnYorxA9TL
 CScZ75WuUT2IcFf7vzXCoF3r0lzObZHSbJYUzpvQPC/z
X-Google-Smtp-Source: APXvYqwWb7rhHFRaAaXH95yyiG3VL8vulGLcCETA7oP2hGua3VjTxTQEGXCw/GWNG+s/AJwk85ic9qgaqheopyB+UJg=
X-Received: by 2002:a0c:b621:: with SMTP id f33mr65018298qve.199.1559039332856; 
 Tue, 28 May 2019 03:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190416064355.29712-1-qkrwngud825@gmail.com>
 <20190416064355.29712-2-qkrwngud825@gmail.com>
 <afdf2ade-6cb7-a335-3584-22bd2681e502@huawei.com>
In-Reply-To: <afdf2ade-6cb7-a335-3584-22bd2681e502@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Tue, 28 May 2019 19:28:40 +0900
Message-ID: <CAD14+f0F0aeqaJMFqoQTBY7wjqAF2H98+Ruvsd3Xd_Wuua8mkw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.196 listed in list.dnswl.org]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.3 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hVZLn-000hTq-2T
Subject: Re: [f2fs-dev] [PATCH 2/2] mkfs.f2fs: make the default extensions
 list much more sensical
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Tue, May 28, 2019 at 7:19 PM Chao Yu <yuchao0@huawei.com> wrote:
> How about adding below extensions:
>
>         "zip",
>         "bin",
>         "dat",
>         "txt",

zip is capable of random updates. I didn't add bz2 for the same reason.
But I do agree that most users won't be constantly updating zip files.

I personally use my Android device with zip treated as cold, but I'm
not sure if it makes good sense to make it as the default that's
supposed to run under various scenarios.

How much different is the random write performance from cold to hot?

But I'm against the idea of adding the rest 3 extensions.
"bin" and "dat" is way too generic. You wouldn't know if a program
happens to heavily update files named .bin/.dat.

For txt, it won't be uncommon for a user to update it frequently.
Moreover, most txt size is pretty small anyways.

And finally, circling back to your original concern, we should be more
careful adding extensions as there's a limit.

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

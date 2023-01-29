Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0307F67FEA4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 12:47:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM69w-0007hm-4z;
	Sun, 29 Jan 2023 11:47:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qxy65535@gmail.com>) id 1pM69o-0007he-Jk
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 11:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AoazifkbtFJztUrCUoGjKnW8RsZbWWLPaoGlneRqOrU=; b=kvFOP6ZtPSE2Ejg39+FVlltZgh
 Dpk/iF7eiOYek4McNmcw53hkrUSglLs5mecHIFO1fP8F5apDROTmQyKygfS2qZbihb8leXQeEqby6
 7gY4E7T1oxRFHHKjiTx08hTwOfQXiT4srZGck5oOGnPAsSQS1A2AcNkCFDLr4lwhRHqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AoazifkbtFJztUrCUoGjKnW8RsZbWWLPaoGlneRqOrU=; b=Sn9qSCFfjjvQzCFxZh5SUZZFF+
 9zFnnCG9p3jpenNfSH8TnE1YggJAVvRZDDdPaJdzSUVAnTjdNE0ZOdwzAUjOJdXk9gegqXhcqqaij
 9nKpor7PL972vzg3oXvhDVU/Jg5VI6RjPN75ELJu/XGHvxnW9uiB6d93MGvYCvCr6rxM=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pM69g-0000Hl-AX for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 11:47:31 +0000
Received: by mail-pl1-f171.google.com with SMTP id 5so8999595plo.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 29 Jan 2023 03:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AoazifkbtFJztUrCUoGjKnW8RsZbWWLPaoGlneRqOrU=;
 b=gAhBl7l4r9LqwU1ROb1AHTQLdmPa1gwLsyRd9OuSQCt5PZuD1JeR2j+AlOrEJjA5Ni
 A7vtf5Br/Me7OqOkn9G1XT4tpCYqs8SvMhdVmSEcScHwcCPiNMaBJacoGKrdU9qPD5lP
 VQW6b5bUVwrXcSSIp8xeV04PY2T/LDuBMJdIA01i9Z8aQWSdP4cuUNvbGghP6Gv1USVc
 5sXCyeBBFJhS+UxlK5gGttCcRnsMnH2C/mp7xn3MYznzlmZPlKeBZ5ocDbsaEcQSqdLd
 wrdciXYUzqk27RP8qt8BFNWG+ngN8Ld8mdf95xXEmyX26olo164K1rgIOdXxF5YZACuY
 XbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoazifkbtFJztUrCUoGjKnW8RsZbWWLPaoGlneRqOrU=;
 b=Bcv4cb9TKVGjyusnK66uM7K8YI/iS5HBQbX/0MjfDitRqFKf18RQSilXvt8MbmFsnh
 Q46kPlE1PN6oDXIV41TYByH8iYPqEUnjCIHmqiw4pb3nWVzeo99mKNdo06BGWPYbwA4H
 N0vBKkqWPwcdelOISAbz9wZSJp+ifEBM7jJ9SYmWr79f0Tom7RaPirDewervq/4LrGe4
 0VSt3kbc7Uj2x1PU1067tbyF1Z7NF88+rpTEbfJTeMmRdOx0HzMJ40zNbYSo0cQ47mNp
 HmBJRoIcj5P6i6oA5rhT7rW4s1rHHbzXgeYR57FNk1mbr+V5+CYaEa2Dtte+durYvkVk
 cNZw==
X-Gm-Message-State: AO0yUKX5cuQIoQjr6GXQmPjAqQ4Yac5cQFz5l+xFfBwfrZXtLYO4VQpN
 urYb0WSVf54mxMtvQBoVI9s=
X-Google-Smtp-Source: AK7set9X6O15t8wm1mu6GVx5f4CuJYVjgkIDWUb1IvHqEO1cTzvq6FHxXO6IHi4n/1PG3AvIAWMWMA==
X-Received: by 2002:a17:902:f392:b0:196:6ff8:69b8 with SMTP id
 f18-20020a170902f39200b001966ff869b8mr2702500ple.27.1674992843575; 
 Sun, 29 Jan 2023 03:47:23 -0800 (PST)
Received: from mi-HP-ProDesk-680-G4-MT ([43.224.245.237])
 by smtp.gmail.com with ESMTPSA id
 jo8-20020a170903054800b001946a3f4d9csm5851810plb.38.2023.01.29.03.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 03:47:22 -0800 (PST)
Date: Sun, 29 Jan 2023 19:47:17 +0800
From: qixiaoyu <qxy65535@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y9ZcxUjQs4Hb0ZoT@mi-HP-ProDesk-680-G4-MT>
References: <20230117115702.GA12653@mi-HP-ProDesk-680-G4-MT>
 <20230117133814.79508-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230117133814.79508-1-frank.li@vivo.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 17, 2023 at 09:38:14PM +0800, Yangtao Li wrote:
 > Hi qixiaoyu, > > > The block age here refers to total data blocks allocated
 of filesystem between two consecutive updates. > > Yes, you ar [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qxy65535[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qxy65535[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
X-Headers-End: 1pM69g-0000Hl-AX
Subject: Re: [f2fs-dev] f2fs: set *_data_age_threshold according to
 user_block_count
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
Cc: qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, xiongping1@xiaomi.com,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 17, 2023 at 09:38:14PM +0800, Yangtao Li wrote:
> Hi qixiaoyu,
> 
> > The block age here refers to total data blocks allocated of filesystem between two consecutive updates.
> 
> Yes, you are right.
> 
> > So, it has nothing to do with storage size.
> 
> But I think that the total data blocks allocated of filesystem between two consecutive updates
> has something to do with the storage size. For example, for a 60M f2fs image, the lifetime_write_kbytes
> will hardly reach 10G, or even 1G.
> 
> Thx,
> Yangtao

Hi Yangtao,

Block update frequency may related to applications and usage patterns,
not storage size. A 1G f2fs image may have a similar block age to a
10G f2fs image when running the same program.

So, it might not be a good idea to decide the *_data_age_threshold
based on user_block_count.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--  counters information
CREATE TABLE counters (
    counter_id TEXT PRIMARY KEY,
    ticker TEXT,
    name TEXT,
    date_listed DATE,
    listing_price NUMERIC(10,2)
);

-- prices_daily information
CREATE TABLE prices_daily (
    counter_id TEXT REFERENCES counters(counter_id),
    trade_date DATE,
    open_mwk NUMERIC(10,2),
    high_mwk NUMERIC(10,2),
    low_mwk NUMERIC(10,2),
    close_mwk NUMERIC(10,2),
    volume BIGINT,
    PRIMARY KEY (counter_id, trade_date)
);


COPY counters(counter_id, ticker, name, date_listed, listing_price)
FROM 'D:\DSCBI\Database\data\mse_selected.csv' DELIMITER ',' CSV HEADER;


COPY prices_daily(counter_id, trade_date, open_mwk, high_mwk, low_mwk, close_mwk, volume)
FROM 'D:\DSCBI\Database\data\price_daily_data.csv'
DELIMITER ','
CSV HEADER;


